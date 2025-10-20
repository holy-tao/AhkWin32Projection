#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPlayToControl.ahk

/**
 * Provides functionality for the IPlayToSource to determine the capabilities of the content.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-iplaytocontrolwithcapabilities
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IPlayToControlWithCapabilities extends IPlayToControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToControlWithCapabilities
     * @type {Guid}
     */
    static IID => Guid("{aa9dd80f-c50a-4220-91c1-332287f82a34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities"]

    /**
     * 
     * @param {Pointer<Integer>} pCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrolwithcapabilities-getcapabilities
     */
    GetCapabilities(pCapabilities) {
        result := ComCall(5, this, "int*", pCapabilities, "HRESULT")
        return result
    }
}
