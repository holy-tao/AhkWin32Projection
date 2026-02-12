#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipPhoneCall3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipPhoneCall3
     * @type {Guid}
     */
    static IID => Guid("{0d891522-e258-4aa9-907a-1aa413c25523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyCallAccepted"]

    /**
     * 
     * @param {Integer} media 
     * @returns {HRESULT} 
     */
    NotifyCallAccepted(media) {
        result := ComCall(6, this, "uint", media, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
