#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowEvents extends IUnknown{
    /**
     * The interface identifier for ISideShowEvents
     * @type {Guid}
     */
    static IID => Guid("{61feca4c-deb4-4a7e-8d75-51f1132d615b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} in_contentId 
     * @param {Pointer<ISideShowContent>} out_ppIContent 
     * @returns {HRESULT} 
     */
    ContentMissing(in_contentId, out_ppIContent) {
        result := ComCall(3, this, "uint", in_contentId, "ptr", out_ppIContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISideShowCapabilities>} in_pICapabilities 
     * @param {Integer} in_dwEventId 
     * @param {Integer} in_dwEventSize 
     * @param {Pointer<Byte>} in_pbEventData 
     * @returns {HRESULT} 
     */
    ApplicationEvent(in_pICapabilities, in_dwEventId, in_dwEventSize, in_pbEventData) {
        result := ComCall(4, this, "ptr", in_pICapabilities, "uint", in_dwEventId, "uint", in_dwEventSize, "char*", in_pbEventData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISideShowCapabilities>} in_pIDevice 
     * @returns {HRESULT} 
     */
    DeviceAdded(in_pIDevice) {
        result := ComCall(5, this, "ptr", in_pIDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISideShowCapabilities>} in_pIDevice 
     * @returns {HRESULT} 
     */
    DeviceRemoved(in_pIDevice) {
        result := ComCall(6, this, "ptr", in_pIDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
