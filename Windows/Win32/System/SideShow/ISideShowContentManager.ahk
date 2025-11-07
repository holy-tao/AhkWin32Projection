#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISideShowCapabilitiesCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowContentManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowContentManager
     * @type {Guid}
     */
    static IID => Guid("{a5d5b66b-eef9-41db-8d7e-e17c33ab10b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "RemoveAll", "SetEventSink", "GetDeviceCapabilities"]

    /**
     * 
     * @param {ISideShowContent} in_pIContent 
     * @returns {HRESULT} 
     */
    Add(in_pIContent) {
        result := ComCall(3, this, "ptr", in_pIContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_contentId 
     * @returns {HRESULT} 
     */
    Remove(in_contentId) {
        result := ComCall(4, this, "uint", in_contentId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISideShowEvents} in_pIEvents 
     * @returns {HRESULT} 
     */
    SetEventSink(in_pIEvents) {
        result := ComCall(6, this, "ptr", in_pIEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISideShowCapabilitiesCollection} 
     */
    GetDeviceCapabilities() {
        result := ComCall(7, this, "ptr*", &out_ppCollection := 0, "HRESULT")
        return ISideShowCapabilitiesCollection(out_ppCollection)
    }
}
