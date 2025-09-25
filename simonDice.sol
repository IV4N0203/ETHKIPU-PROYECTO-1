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
    ///@notice variable para almacenar mensaje de simon
    string private _mensajeBase = "Simon dice:"; // mensaje fijo
    string private _mensajeActual = "Hola mundo soy Simon"; // mensaje dinamico

    /*//////////////
            Eventos
    ////////////*/

    ///@notice evento emitido con el mensaje actualizado
    event MensajeActualizado(
        string nuevoMensajeCompleto
        );
	
    /*//////////////
            Funciones
    ////////////*/

    
        ///  @notice funcion para actualizar mensaje en la blockchain
        ///  @param nuevoMensaje el nuevo mensaje (sin prefijo)


    function actualizarMensaje(string memory nuevoMensaje) public {
        _mensajeActual = nuevoMensaje;

        string memory nuevoMensajeCompleto = string( 
                abi.encodePacked(_mensajeBase, " ", _mensajeActual)
                );
     /// @notice evento emitido cuando cambia el mensaje
        emit MensajeActualizado(nuevoMensajeCompleto);
    }

    /// @notice funcion get para devolver mensaje guardado junto con el prefijo
    /// @return mensaje concatenado
        function getMensajeCompleto() public view returns (string memory) {
                return string(abi.encodePacked(_mensajeBase, " ", _mensajeActual));
        }
}