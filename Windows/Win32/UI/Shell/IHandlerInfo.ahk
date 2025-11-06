#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supplies methods that provide information about the handler to methods of the IHandlerActivationHost interface.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ihandlerinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHandlerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandlerInfo
     * @type {Guid}
     */
    static IID => Guid("{997706ef-f880-453b-8118-39e1a2d2655a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationDisplayName", "GetApplicationPublisher", "GetApplicationIconReference"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationdisplayname
     */
    GetApplicationDisplayName() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationpublisher
     */
    GetApplicationPublisher() {
        result := ComCall(4, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationiconreference
     */
    GetApplicationIconReference() {
        result := ComCall(5, this, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
