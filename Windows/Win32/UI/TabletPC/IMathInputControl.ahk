#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes methods that turn ink input into interpreted math output.
 * @see https://learn.microsoft.com/windows/win32/api/micaut/nn-micaut-imathinputcontrol
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
     * @remarks
     * Shows the Math Input Control if it is not visible. If the control is already visible, puts the control on top of the z-order stack.
     * If <a href="https://docs.microsoft.com/windows/desktop/api/micaut/nf-micaut-imathinputcontrol-setposition">SetPosition</a> is not called, <b>Show</b> will display the control at the top-left corner of the screen ((0, 0) in screen coordinates). 
     * The control's width and height will be at their minimum.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-show
     */
    Show() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Hides the control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-hide
     */
    Hide() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the control is visible.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> to show the control; <b>VARIANT_FALSE</b> to hide the control.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-isvisible
     */
    IsVisible() {
        result := ComCall(9, this, "short*", &pvbShown := 0, "HRESULT")
        return pvbShown
    }

    /**
     * Retrieves the position and size of the control.
     * @remarks
     * This method returns the control size and position even if the control is not visible.
     * 
     * This method returns the minimal possible width and height of the control if it is called immediately after creation of the control.
     * @param {Pointer<Integer>} Left The leftmost position of the control.
     * @param {Pointer<Integer>} Top The highest position of the control.
     * @param {Pointer<Integer>} Right The rightmost position of the control.
     * @param {Pointer<Integer>} Bottom The lowest position of the control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-getposition
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
     * @remarks
     * This method can be called regardless of the control visibility state.
     * 
     * This method will succeed even if parameters are not valid. If the rectangle is larger than the maximum allowed size of the control (desktop window), the maximum possible size is used instead. If the rectangle is smaller than the minimal size of the control, or too small to keep the ink and result preview intact, the minimal possible size is used instead.
     * 
     * 
     * If  the method returns <b>S_FALSE</b>, the  <a href="https://docs.microsoft.com/windows/desktop/api/micaut/nf-micaut-imathinputcontrol-getposition">GetPosition</a> method will return the actual size characteristics of the control.
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
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setposition
     */
    SetPosition(Left, Top, Right, Bottom) {
        result := ComCall(11, this, "int", Left, "int", Top, "int", Right, "int", Bottom, "HRESULT")
        return result
    }

    /**
     * Clears all ink from the control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Determines whether a button or background has custom painting.
     * @remarks
     * If custom painting is enabled, the button or background will be rendered at least partially—and possibly completely—by the container.
     * @param {Integer} Element The identifier for a button or background.
     * @param {VARIANT_BOOL} Paint <b>VARIANT_TRUE</b> to enable custom painting for the specified UI element; otherwise, <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setcustompaint
     */
    SetCustomPaint(Element, Paint) {
        result := ComCall(13, this, "int", Element, "short", Paint, "HRESULT")
        return result
    }

    /**
     * Modifies the string that will be used as the control's caption when the window is created.
     * @param {BSTR} CaptionText The caption text.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setcaptiontext
     */
    SetCaptionText(CaptionText) {
        CaptionText := CaptionText is String ? BSTR.Alloc(CaptionText).Value : CaptionText

        result := ComCall(14, this, "ptr", CaptionText, "HRESULT")
        return result
    }

    /**
     * Processes ink and triggers recognition.
     * @remarks
     * This method will only work when the control is visible.
     * When that ink exceeds the control's current size, and automatic growth is enabled, the control tries to accommodate the input. If the control cannot supply enough space, ink is proportionally shrunk to fit the maximum available size.
     * @param {IInkDisp} _Ink 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-loadink
     */
    LoadInk(_Ink) {
        result := ComCall(15, this, "ptr", _Ink, "HRESULT")
        return result
    }

    /**
     * Modifies the window that owns this control.
     * @remarks
     * The math input control always appears on top of the window that owns it.
     * @param {Pointer} OwnerWindow A handle to the owner window.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setownerwindow
     */
    SetOwnerWindow(OwnerWindow) {
        result := ComCall(16, this, "ptr", OwnerWindow, "HRESULT")
        return result
    }

    /**
     * Determines whether the extended set of control buttons is shown.
     * @remarks
     * The basic button set is shown by default.
     * 
     * The basic button set contains the <b>Clear</b>, <b>Erase</b>, <b>Insert</b>, <b>Select and Correct</b>, and <b>Write</b> buttons. The extended button set contains the basic set plus the <b>Redo</b> and <b>Undo</b> buttons.
     * 
     * The following image shows the Math Input Control with extended buttons enabled.
     * 
     * 
     * 
     * <img alt="Math input control with extended buttons enabled" src="./images/MIC.png"/>
     * The following image shows the Math Input Control with extended buttons disabled.
     * 
     * 
     * 
     * <img alt="Math input control with extended buttons disabled" src="./images/MIC_no_extended.png"/>
     * @param {VARIANT_BOOL} Extended <b>VARIANT_TRUE</b> to show the extended button set; <b>VARIANT_FALSE</b> to show the basic button set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-enableextendedbuttons
     */
    EnableExtendedButtons(Extended) {
        result := ComCall(17, this, "short", Extended, "HRESULT")
        return result
    }

    /**
     * Retrieves the height in pixels of the preview area.
     * @remarks
     * Manually resizing the control can affect the height of the result-preview area.
     * @returns {Integer} The height in pixels of the preview area.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-getpreviewheight
     */
    GetPreviewHeight() {
        result := ComCall(18, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * Modifies the preview-area height in pixels.
     * @remarks
     * The preview area has predefined minimum and maximum sizes that depend on the current height of the control.
     * If the method returns <b>S_FALSE</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/micaut/nf-micaut-imathinputcontrol-getpreviewheight">GetPreviewHeight</a> method will return the actual size characteristics of the control.
     * 
     * The following image shows the Math Input Control with the default preview height.
     * 
     * 
     * 
     * <img alt="Math input control with default preview height" src="./images/mic.png"/>
     * The following image shows the Math Input Control with a custom preview height.
     * 
     * 
     * 
     * <img alt="Math input control with custom preview height" src="./images/mic_big_preview.png"/>
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
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setpreviewheight
     */
    SetPreviewHeight(Height) {
        result := ComCall(19, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * Determines whether the control automatically grows when input is entered beyond the control's current range.
     * @remarks
     * Automatic growth is enabled by default.
     * @param {VARIANT_BOOL} AutoGrow <b>VARIANT_TRUE</b> to enable automatic growth; otherwise, <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-enableautogrow
     */
    EnableAutoGrow(AutoGrow) {
        result := ComCall(20, this, "short", AutoGrow, "HRESULT")
        return result
    }

    /**
     * Adds a new function-name definition to the list of custom math functions that the recognizer accepts.
     * @remarks
     * This function is used to add custom math functions that do not exist in the default dictionary. After a function has been added to the dictionary of functions, the recognizer will be able to read it; however, a custom function name may be recognizable only letter by letter rather than as a whole word in cursive.
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
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-addfunctionname
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
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-removefunctionname
     */
    RemoveFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(22, this, "ptr", FunctionName, "HRESULT")
        return result
    }

    /**
     * Retrieves the icon to be used for the hover target to launch math input control.
     * @remarks
     * Applications are strongly encouraged to use this icon if implementing a hover target.
     * The icon is returned in .ico format and will match the system dots per inch (DPI) setting.  
     *       
     * 
     * The icon is provided as a 32-bit image with fixed width and height. 
     * At 96 DPI, the values are Width = 63, Height = 49. 
     * For other DPIs these values are changed accordingly. 
     * For example, on a 144 DPI system: Width = 63 * 144 / 96 and Height = 49 *144 / 96. 
     * The application that retrieves the hover icon is responsible for releasing the icon resources.
     * @returns {IPictureDisp} The address of the pointer to the hover target icon.
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-gethovericon
     */
    GetHoverIcon() {
        result := ComCall(23, this, "ptr*", &HoverImage := 0, "HRESULT")
        return IPictureDisp(HoverImage)
    }
}
