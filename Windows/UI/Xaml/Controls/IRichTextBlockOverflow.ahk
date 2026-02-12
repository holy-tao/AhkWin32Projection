#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RichTextBlockOverflow.ahk
#Include ..\Thickness.ahk
#Include .\RichTextBlock.ahk
#Include ..\Documents\TextPointer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockOverflow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockOverflow
     * @type {Guid}
     */
    static IID => Guid("{4f93749b-dac3-4a42-9cbb-99f0de37c071}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverflowContentTarget", "put_OverflowContentTarget", "get_Padding", "put_Padding", "get_ContentSource", "get_HasOverflowContent", "get_ContentStart", "get_ContentEnd", "get_BaselineOffset", "GetPositionFromPoint", "Focus"]

    /**
     * @type {RichTextBlockOverflow} 
     */
    OverflowContentTarget {
        get => this.get_OverflowContentTarget()
        set => this.put_OverflowContentTarget(value)
    }

    /**
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * @type {RichTextBlock} 
     */
    ContentSource {
        get => this.get_ContentSource()
    }

    /**
     * @type {Boolean} 
     */
    HasOverflowContent {
        get => this.get_HasOverflowContent()
    }

    /**
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * @type {Float} 
     */
    BaselineOffset {
        get => this.get_BaselineOffset()
    }

    /**
     * 
     * @returns {RichTextBlockOverflow} 
     */
    get_OverflowContentTarget() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RichTextBlockOverflow(value)
    }

    /**
     * 
     * @param {RichTextBlockOverflow} value 
     * @returns {HRESULT} 
     */
    put_OverflowContentTarget(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        value := Thickness()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RichTextBlock} 
     */
    get_ContentSource() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RichTextBlock(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasOverflowContent() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BaselineOffset() {
        result := ComCall(14, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} point_ 
     * @returns {TextPointer} 
     */
    GetPositionFromPoint(point_) {
        result := ComCall(15, this, "ptr", point_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(result_)
    }

    /**
     * Configures the [FocusControl](focuscontrol.md) object with values specified in the provided [FocusSettings](focussettings.md) object.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value in the [FocusSettings](focussettings.md) object supplied to this method, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @param {Integer} value 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.configure
     */
    Focus(value) {
        result := ComCall(16, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
