#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the host container of a windowless rich edit control to override the control's Microsoft UI Automation accessibility properties.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nn-textserv-irichedituiaoverrides
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IRicheditUiaOverrides extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyOverrideValue"]

    /**
     * Retrieves the host container's override value for the specified Microsoft UI Automation accessibility property of a windowless rich edit control.
     * @param {Integer} propertyId Type: <b>PROPERTYID </b>
     * 
     * The identifier of the property to retrieve.
     * @param {Pointer<VARIANT>} pRetValue Type: <b>VARIANT*</b>
     * 
     * The host container's override value for the <i>propertyId</i> property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-irichedituiaoverrides-getpropertyoverridevalue
     */
    GetPropertyOverrideValue(propertyId, pRetValue) {
        result := ComCall(3, this, "int", propertyId, "ptr", pRetValue, "HRESULT")
        return result
    }
}
