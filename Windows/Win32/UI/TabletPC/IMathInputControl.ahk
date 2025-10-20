#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-show
     */
    Show() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-hide
     */
    Hide() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbShown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-isvisible
     */
    IsVisible(pvbShown) {
        result := ComCall(9, this, "ptr", pvbShown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Left 
     * @param {Pointer<Integer>} Top 
     * @param {Pointer<Integer>} Right 
     * @param {Pointer<Integer>} Bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-getposition
     */
    GetPosition(Left, Top, Right, Bottom) {
        result := ComCall(10, this, "int*", Left, "int*", Top, "int*", Right, "int*", Bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Right 
     * @param {Integer} Bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setposition
     */
    SetPosition(Left, Top, Right, Bottom) {
        result := ComCall(11, this, "int", Left, "int", Top, "int", Right, "int", Bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Element 
     * @param {VARIANT_BOOL} Paint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setcustompaint
     */
    SetCustomPaint(Element, Paint) {
        result := ComCall(13, this, "int", Element, "short", Paint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} CaptionText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setcaptiontext
     */
    SetCaptionText(CaptionText) {
        CaptionText := CaptionText is String ? BSTR.Alloc(CaptionText).Value : CaptionText

        result := ComCall(14, this, "ptr", CaptionText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkDisp} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-loadink
     */
    LoadInk(Ink) {
        result := ComCall(15, this, "ptr", Ink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} OwnerWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setownerwindow
     */
    SetOwnerWindow(OwnerWindow) {
        result := ComCall(16, this, "ptr", OwnerWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Extended 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-enableextendedbuttons
     */
    EnableExtendedButtons(Extended) {
        result := ComCall(17, this, "short", Extended, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-getpreviewheight
     */
    GetPreviewHeight(Height) {
        result := ComCall(18, this, "int*", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-setpreviewheight
     */
    SetPreviewHeight(Height) {
        result := ComCall(19, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoGrow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-enableautogrow
     */
    EnableAutoGrow(AutoGrow) {
        result := ComCall(20, this, "short", AutoGrow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FunctionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-addfunctionname
     */
    AddFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(21, this, "ptr", FunctionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FunctionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-removefunctionname
     */
    RemoveFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(22, this, "ptr", FunctionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} HoverImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/micaut/nf-micaut-imathinputcontrol-gethovericon
     */
    GetHoverIcon(HoverImage) {
        result := ComCall(23, this, "ptr*", HoverImage, "HRESULT")
        return result
    }
}
