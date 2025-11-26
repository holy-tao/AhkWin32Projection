#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes methods that turn ink input into interpreted math output.
 * @see https://docs.microsoft.com/windows/win32/api//micaut/nn-micaut-imathinputcontrol
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IMathInputControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMathInputControl
     * @type {Guid}
     */
    static IID => Guid("{eba615aa-fac6-4738-ba5f-ff09e9fe473e}")

    /**
     * The class identifier for MathInputControl
     * @type {Guid}
     */
    static CLSID => Guid("{c561816c-14d8-4090-830c-98d994b21c7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show", "Hide", "IsVisible", "GetPosition", "SetPosition", "Clear", "SetCustomPaint", "SetCaptionText", "LoadInk", "SetOwnerWindow", "EnableExtendedButtons", "GetPreviewHeight", "SetPreviewHeight", "EnableAutoGrow", "AddFunctionName", "RemoveFunctionName", "GetHoverIcon"]

    /**
     * Shows the control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-show
     */
    Show() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Hides the control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-hide
     */
    Hide() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the control is visible.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> to show the control; <b>VARIANT_FALSE</b> to hide the control.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-isvisible
     */
    IsVisible() {
        result := ComCall(9, this, "short*", &pvbShown := 0, "HRESULT")
        return pvbShown
    }

    /**
     * Retrieves the position and size of the control.
     * @param {Pointer<Integer>} Left The leftmost position of the control.
     * @param {Pointer<Integer>} Top The highest position of the control.
     * @param {Pointer<Integer>} Right The rightmost position of the control.
     * @param {Pointer<Integer>} Bottom The lowest position of the control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-getposition
     */
    GetPosition(Left, Top, Right, Bottom) {
        LeftMarshal := Left is VarRef ? "int*" : "ptr"
        TopMarshal := Top is VarRef ? "int*" : "ptr"
        RightMarshal := Right is VarRef ? "int*" : "ptr"
        BottomMarshal := Bottom is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, LeftMarshal, Left, TopMarshal, Top, RightMarshal, Right, BottomMarshal, Bottom, "HRESULT")
        return result
    }

    /**
     * Modifies the location and size of the control.
     * @param {Integer} Left The leftmost position of the control.
     * @param {Integer} Top The highest position of the control.
     * @param {Integer} Right The rightmost position of the control.
     * @param {Integer} Bottom The lowest position of the control.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control was resized but the resulting width, height, or both are not equal to the input parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-setposition
     */
    SetPosition(Left, Top, Right, Bottom) {
        result := ComCall(11, this, "int", Left, "int", Top, "int", Right, "int", Bottom, "HRESULT")
        return result
    }

    /**
     * Clears all ink from the control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Determines whether a button or background has custom painting.
     * @param {Integer} Element The identifier for a button or background.
     * @param {VARIANT_BOOL} Paint <b>VARIANT_TRUE</b> to enable custom painting for the specified UI element; otherwise, <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-setcustompaint
     */
    SetCustomPaint(Element, Paint) {
        result := ComCall(13, this, "int", Element, "short", Paint, "HRESULT")
        return result
    }

    /**
     * Modifies the string that will be used as the control's caption when the window is created.
     * @param {BSTR} CaptionText The caption text.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-setcaptiontext
     */
    SetCaptionText(CaptionText) {
        CaptionText := CaptionText is String ? BSTR.Alloc(CaptionText).Value : CaptionText

        result := ComCall(14, this, "ptr", CaptionText, "HRESULT")
        return result
    }

    /**
     * Processes ink and triggers recognition.
     * @param {IInkDisp} Ink The ink object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-loadink
     */
    LoadInk(Ink) {
        result := ComCall(15, this, "ptr", Ink, "HRESULT")
        return result
    }

    /**
     * Modifies the window that owns this control.
     * @param {Pointer} OwnerWindow A handle to the owner window.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-setownerwindow
     */
    SetOwnerWindow(OwnerWindow) {
        result := ComCall(16, this, "ptr", OwnerWindow, "HRESULT")
        return result
    }

    /**
     * Determines whether the extended set of control buttons is shown.
     * @param {VARIANT_BOOL} Extended <b>VARIANT_TRUE</b> to show the extended button set; <b>VARIANT_FALSE</b> to show the basic button set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-enableextendedbuttons
     */
    EnableExtendedButtons(Extended) {
        result := ComCall(17, this, "short", Extended, "HRESULT")
        return result
    }

    /**
     * Retrieves the height in pixels of the preview area.
     * @returns {Integer} The height in pixels of the preview area.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-getpreviewheight
     */
    GetPreviewHeight() {
        result := ComCall(18, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * Modifies the preview-area height in pixels.
     * @param {Integer} Height The preview-area height in pixels.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The height specified by the <i>Height</i> parameter is outside the control's bounds.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-setpreviewheight
     */
    SetPreviewHeight(Height) {
        result := ComCall(19, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * Determines whether the control automatically grows when input is entered beyond the control's current range.
     * @param {VARIANT_BOOL} AutoGrow <b>VARIANT_TRUE</b> to enable automatic growth; otherwise, <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-enableautogrow
     */
    EnableAutoGrow(AutoGrow) {
        result := ComCall(20, this, "short", AutoGrow, "HRESULT")
        return result
    }

    /**
     * Adds a new function-name definition to the list of custom math functions that the recognizer accepts.
     * @param {BSTR} FunctionName The name of the function to be added.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name could not be added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-addfunctionname
     */
    AddFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(21, this, "ptr", FunctionName, "HRESULT")
        return result
    }

    /**
     * Removes a function-name definition from the list of custom math functions that the recognizer accepts.
     * @param {BSTR} FunctionName The name of the function to remove.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The named math function cannot be removed because it is not in the list of custom math functions that the recognizer accepts.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-removefunctionname
     */
    RemoveFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(22, this, "ptr", FunctionName, "HRESULT")
        return result
    }

    /**
     * Retrieves the icon to be used for the hover target to launch math input control.
     * @returns {IPictureDisp} The address of the pointer to the hover target icon.
     * @see https://docs.microsoft.com/windows/win32/api//micaut/nf-micaut-imathinputcontrol-gethovericon
     */
    GetHoverIcon() {
        result := ComCall(23, this, "ptr*", &HoverImage := 0, "HRESULT")
        return IPictureDisp(HoverImage)
    }
}
