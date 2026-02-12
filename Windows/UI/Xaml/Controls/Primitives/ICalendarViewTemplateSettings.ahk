#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICalendarViewTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{56c71483-64e1-477c-8a0b-cb2f3334b9b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinViewWidth", "get_HeaderText", "get_WeekDay1", "get_WeekDay2", "get_WeekDay3", "get_WeekDay4", "get_WeekDay5", "get_WeekDay6", "get_WeekDay7", "get_HasMoreContentAfter", "get_HasMoreContentBefore", "get_HasMoreViews", "get_ClipRect", "get_CenterX", "get_CenterY"]

    /**
     * @type {Float} 
     */
    MinViewWidth {
        get => this.get_MinViewWidth()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderText {
        get => this.get_HeaderText()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay1 {
        get => this.get_WeekDay1()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay2 {
        get => this.get_WeekDay2()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay3 {
        get => this.get_WeekDay3()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay4 {
        get => this.get_WeekDay4()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay5 {
        get => this.get_WeekDay5()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay6 {
        get => this.get_WeekDay6()
    }

    /**
     * @type {HSTRING} 
     */
    WeekDay7 {
        get => this.get_WeekDay7()
    }

    /**
     * @type {Boolean} 
     */
    HasMoreContentAfter {
        get => this.get_HasMoreContentAfter()
    }

    /**
     * @type {Boolean} 
     */
    HasMoreContentBefore {
        get => this.get_HasMoreContentBefore()
    }

    /**
     * @type {Boolean} 
     */
    HasMoreViews {
        get => this.get_HasMoreViews()
    }

    /**
     * @type {RECT} 
     */
    ClipRect {
        get => this.get_ClipRect()
    }

    /**
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
    }

    /**
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinViewWidth() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderText() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay1() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay2() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay3() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay4() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay5() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay6() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay7() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreContentAfter() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreContentBefore() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreViews() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClipRect() {
        value := RECT()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        result := ComCall(19, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
