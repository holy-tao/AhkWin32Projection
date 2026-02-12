#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IUploadOperation4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUploadOperation4
     * @type {Guid}
     */
    static IID => Guid("{50edef31-fac5-41ee-b030-dc77caee9faa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRequestHeader", "RemoveRequestHeader"]

    /**
     * 
     * @param {HSTRING} headerName 
     * @param {HSTRING} headerValue 
     * @returns {HRESULT} 
     */
    SetRequestHeader(headerName, headerValue) {
        if(headerName is String) {
            pin := HSTRING.Create(headerName)
            headerName := pin.Value
        }
        headerName := headerName is Win32Handle ? NumGet(headerName, "ptr") : headerName
        if(headerValue is String) {
            pin := HSTRING.Create(headerValue)
            headerValue := pin.Value
        }
        headerValue := headerValue is Win32Handle ? NumGet(headerValue, "ptr") : headerValue

        result := ComCall(6, this, "ptr", headerName, "ptr", headerValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} headerName 
     * @returns {HRESULT} 
     */
    RemoveRequestHeader(headerName) {
        if(headerName is String) {
            pin := HSTRING.Create(headerName)
            headerName := pin.Value
        }
        headerName := headerName is Win32Handle ? NumGet(headerName, "ptr") : headerName

        result := ComCall(7, this, "ptr", headerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
