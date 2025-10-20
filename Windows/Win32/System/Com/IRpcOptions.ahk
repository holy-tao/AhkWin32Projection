#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables callers to set or query the values of various properties that control how COM handles remote procedure calls (RPC).
 * @remarks
 * 
  * Using this interface, callers can set or query the COMBND_RPCTIMEOUT property, which controls how long your machine will attempt to establish RPC communications with another before failing. The property can have any one of the values enumerated in the following table.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>RPC_C_BINDING_INFINITE_TIMEOUT
  * </td>
  * <td>Keep trying to establish communications with no timeout.
  * </td>
  * </tr>
  * <tr>
  * <td>RPC_C_BINDING_MIN_TIMEOUT
  * </td>
  * <td>Try to establish communications for the minimum time required by the protocol. This value favors performance over reliability.</td>
  * </tr>
  * <tr>
  * <td>RPC_C_BINDING_DEFAULT_TIMEOUT
  * </td>
  * <td>Try to establish communications for the default time. The value strikes a balance between performance and reliability.</td>
  * </tr>
  * <tr>
  * <td>RPC_C_BINDING_MAX_TIMEOUT
  * </td>
  * <td>Try to establish communications for the maximum time allowed by the protocol. This value favors reliability over performance.</td>
  * </tr>
  * </table>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irpcoptions
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcOptions extends IUnknown{
    /**
     * The interface identifier for IRpcOptions
     * @type {Guid}
     */
    static IID => Guid("{00000144-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pPrx 
     * @param {Integer} dwProperty 
     * @param {Pointer} dwValue 
     * @returns {HRESULT} 
     */
    Set(pPrx, dwProperty, dwValue) {
        result := ComCall(3, this, "ptr", pPrx, "int", dwProperty, "ptr", dwValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pPrx 
     * @param {Integer} dwProperty 
     * @param {Pointer<UIntPtr>} pdwValue 
     * @returns {HRESULT} 
     */
    Query(pPrx, dwProperty, pdwValue) {
        result := ComCall(4, this, "ptr", pPrx, "int", dwProperty, "ptr*", pdwValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
