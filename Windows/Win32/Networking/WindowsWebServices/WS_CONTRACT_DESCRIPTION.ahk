#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The metadata for a service contract for service model.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_contract_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CONTRACT_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total number of service operations that are part of the contract.
     * @type {Integer}
     */
    operationCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of individual operation description, each representing 
     *                     a service operations.
     * @type {Pointer<WS_OPERATION_DESCRIPTION>}
     */
    operations {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
