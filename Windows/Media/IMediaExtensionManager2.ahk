#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaExtensionManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaExtensionManager2
     * @type {Guid}
     */
    static IID => Guid("{5bcebf47-4043-4fed-acaf-54ec29dfb1f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterMediaExtensionForAppService"]

    /**
     * 
     * @param {IMediaExtension} extension_ 
     * @param {AppServiceConnection} connection_ 
     * @returns {HRESULT} 
     */
    RegisterMediaExtensionForAppService(extension_, connection_) {
        result := ComCall(6, this, "ptr", extension_, "ptr", connection_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
