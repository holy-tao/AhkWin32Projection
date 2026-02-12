#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsHostMessengerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsHostMessengerStatics
     * @type {Guid}
     */
    static IID => Guid("{06e444bb-53c0-4889-8fa3-53592e37cf21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PostMessageToReceiver", "GetFileId"]

    /**
     * 
     * @param {Guid} receiverId 
     * @param {IVectorView<IInspectable>} message 
     * @returns {HRESULT} 
     */
    PostMessageToReceiver(receiverId, message) {
        result := ComCall(6, this, "ptr", receiverId, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @returns {Guid} 
     */
    GetFileId(filePath) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result_ := Guid()
        result := ComCall(7, this, "ptr", filePath, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
