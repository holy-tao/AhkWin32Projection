#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IRawElementProviderSimple2.ahk

/**
 * Extends the IRawElementProviderSimple2 interface to enable retrieving metadata about how accessible technology should say the preferred content type.
 * @remarks
 * 
 * Screen reading accessibility tools like Narrator use a speech synthesizer to read what an app is showing.  Speech synthesizers usually read the provided content well based on the content description.
 * 
 * However, the speech synthesizer could use some help describing the preferred content type. The SayAs command provides accurate content reading from a Microsoft UI Automation provider to a UI Automation client (such as a screen reader) through UI Automation core APIs.
 * 
 * Examples:
 * 
 * <ul>
 * <li>Given the date 10/4, is the format Month/Day or Day/Month?
 * If a screen reader does not know, you could hear October 4th or 10th April. 
 * </li>
 * <li>
 * Given the string "10-100", is this
 * "Ten to one hundred" or
 * "Ten minus 100"?
 * 
 * The ability to mark the "10" as a number and the "-100" as a number helps active technology (AT) read it better.
 * 
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementprovidersimple3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderSimple3 extends IRawElementProviderSimple2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderSimple3
     * @type {Guid}
     */
    static IID => Guid("{fcf5d820-d7ec-4613-bdf6-42a84ce7daaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadataValue"]

    /**
     * 
     * @param {Integer} targetId 
     * @param {Integer} metadataId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple3-getmetadatavalue
     */
    GetMetadataValue(targetId, metadataId) {
        returnVal := VARIANT()
        result := ComCall(8, this, "int", targetId, "int", metadataId, "ptr", returnVal, "HRESULT")
        return returnVal
    }
}
