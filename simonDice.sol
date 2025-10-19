///SPDX-License-Identifier: MIT 
pragma solidity 0.8.26;

/**
 * @title simonDice
 * @author IV4N0203 - AIR.dev
 * @notice Este contrato forma parte del primer proyecto del Ethereum Developer Pack
 * @custom:security Este es un contrato educativo y no debe ser usado en produccion 
 */
contract simonDice {
    /*/////////////
            Variables de Estado
    /////////////////*/
    
        /// @notice Prefijo inmutable para todos los mensajes.

        string private constant _MENSAJE_BASE = "Simon dice:";
    
    ///@notice variable para almacenar mensaje de simon
    
    string private _mensajeActual = "Hola mundo soy Simon";

    /*//////////////
            Eventos
    ////////////*/

    ///@notice evento emitido con el mensaje actualizado
    event MensajeActualizado(string nuevoMensajeCompleto);
	
    /*//////////////
            Funciones
    ////////////*/

    
        ///  @notice Funcion interna para concatenar el prefijo con el mensaje actual
        ///  @param mensaje dinamico a concatenar.
        /// @return Mensaje completo con prefijo.


     function _concatenarMensaje(string memory mensaje) private pure returns (string memory) {
        return string (bytes.concat(bytes(_MENSAJE_BASE), bytes(" "), bytes(mensaje)));
    }

    /// @notice Actualiza el mensaje en la blockchain.
    /// @param nuevoMensaje Nuevo mensaje (sin prefijo).
    function actualizarMensaje(string memory nuevoMensaje) public {
        _mensajeActual = nuevoMensaje;
        emit MensajeActualizado(_concatenarMensaje(nuevoMensaje));
    }

    /// @notice Devuelve el mensaje completo con prefijo.
    /// @return Mensaje concatenado.
    function getMensajeCompleto() public view returns (string memory) {
        return _concatenarMensaje(_mensajeActual);
    }
}
