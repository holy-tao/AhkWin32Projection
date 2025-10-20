#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-isupporterrorinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISupportErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{df0b3d60-548f-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InterfaceSupportsErrorInfo"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-isupporterrorinfo-interfacesupportserrorinfo
     */
    InterfaceSupportsErrorInfo(riid) {
        result := ComCall(3, this, "ptr", riid, "HRESULT")
        return result
    }
}
