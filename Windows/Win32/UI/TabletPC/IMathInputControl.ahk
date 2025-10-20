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
     * 
     * @returns {HRESULT} 
     */
    Show() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Hide() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbShown 
     * @returns {HRESULT} 
     */
    IsVisible(pvbShown) {
        result := ComCall(9, this, "ptr", pvbShown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Left 
     * @param {Pointer<Int32>} Top 
     * @param {Pointer<Int32>} Right 
     * @param {Pointer<Int32>} Bottom 
     * @returns {HRESULT} 
     */
    GetPosition(Left, Top, Right, Bottom) {
        result := ComCall(10, this, "int*", Left, "int*", Top, "int*", Right, "int*", Bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Right 
     * @param {Integer} Bottom 
     * @returns {HRESULT} 
     */
    SetPosition(Left, Top, Right, Bottom) {
        result := ComCall(11, this, "int", Left, "int", Top, "int", Right, "int", Bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Element 
     * @param {VARIANT_BOOL} Paint 
     * @returns {HRESULT} 
     */
    SetCustomPaint(Element, Paint) {
        result := ComCall(13, this, "int", Element, "short", Paint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} CaptionText 
     * @returns {HRESULT} 
     */
    SetCaptionText(CaptionText) {
        CaptionText := CaptionText is String ? BSTR.Alloc(CaptionText).Value : CaptionText

        result := ComCall(14, this, "ptr", CaptionText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     */
    LoadInk(Ink) {
        result := ComCall(15, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} OwnerWindow 
     * @returns {HRESULT} 
     */
    SetOwnerWindow(OwnerWindow) {
        result := ComCall(16, this, "ptr", OwnerWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Extended 
     * @returns {HRESULT} 
     */
    EnableExtendedButtons(Extended) {
        result := ComCall(17, this, "short", Extended, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Height 
     * @returns {HRESULT} 
     */
    GetPreviewHeight(Height) {
        result := ComCall(18, this, "int*", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetPreviewHeight(Height) {
        result := ComCall(19, this, "int", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoGrow 
     * @returns {HRESULT} 
     */
    EnableAutoGrow(AutoGrow) {
        result := ComCall(20, this, "short", AutoGrow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FunctionName 
     * @returns {HRESULT} 
     */
    AddFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(21, this, "ptr", FunctionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FunctionName 
     * @returns {HRESULT} 
     */
    RemoveFunctionName(FunctionName) {
        FunctionName := FunctionName is String ? BSTR.Alloc(FunctionName).Value : FunctionName

        result := ComCall(22, this, "ptr", FunctionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} HoverImage 
     * @returns {HRESULT} 
     */
    GetHoverIcon(HoverImage) {
        result := ComCall(23, this, "ptr", HoverImage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
