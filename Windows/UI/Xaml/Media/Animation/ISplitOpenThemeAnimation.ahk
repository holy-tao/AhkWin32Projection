#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ISplitOpenThemeAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplitOpenThemeAnimation
     * @type {Guid}
     */
    static IID => Guid("{785fd7aa-5456-4639-8fd2-26bae6a5ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpenedTargetName", "put_OpenedTargetName", "get_OpenedTarget", "put_OpenedTarget", "get_ClosedTargetName", "put_ClosedTargetName", "get_ClosedTarget", "put_ClosedTarget", "get_ContentTargetName", "put_ContentTargetName", "get_ContentTarget", "put_ContentTarget", "get_OpenedLength", "put_OpenedLength", "get_ClosedLength", "put_ClosedLength", "get_OffsetFromCenter", "put_OffsetFromCenter", "get_ContentTranslationDirection", "put_ContentTranslationDirection", "get_ContentTranslationOffset", "put_ContentTranslationOffset"]

    /**
     * @type {HSTRING} 
     */
    OpenedTargetName {
        get => this.get_OpenedTargetName()
        set => this.put_OpenedTargetName(value)
    }

    /**
     * @type {DependencyObject} 
     */
    OpenedTarget {
        get => this.get_OpenedTarget()
        set => this.put_OpenedTarget(value)
    }

    /**
     * @type {HSTRING} 
     */
    ClosedTargetName {
        get => this.get_ClosedTargetName()
        set => this.put_ClosedTargetName(value)
    }

    /**
     * @type {DependencyObject} 
     */
    ClosedTarget {
        get => this.get_ClosedTarget()
        set => this.put_ClosedTarget(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContentTargetName {
        get => this.get_ContentTargetName()
        set => this.put_ContentTargetName(value)
    }

    /**
     * @type {DependencyObject} 
     */
    ContentTarget {
        get => this.get_ContentTarget()
        set => this.put_ContentTarget(value)
    }

    /**
     * @type {Float} 
     */
    OpenedLength {
        get => this.get_OpenedLength()
        set => this.put_OpenedLength(value)
    }

    /**
     * @type {Float} 
     */
    ClosedLength {
        get => this.get_ClosedLength()
        set => this.put_ClosedLength(value)
    }

    /**
     * @type {Float} 
     */
    OffsetFromCenter {
        get => this.get_OffsetFromCenter()
        set => this.put_OffsetFromCenter(value)
    }

    /**
     * @type {Integer} 
     */
    ContentTranslationDirection {
        get => this.get_ContentTranslationDirection()
        set => this.put_ContentTranslationDirection(value)
    }

    /**
     * @type {Float} 
     */
    ContentTranslationOffset {
        get => this.get_ContentTranslationOffset()
        set => this.put_ContentTranslationOffset(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OpenedTargetName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OpenedTargetName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OpenedTarget() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_OpenedTarget(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClosedTargetName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ClosedTargetName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ClosedTarget() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ClosedTarget(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentTargetName() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentTargetName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ContentTarget() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ContentTarget(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenedLength() {
        result := ComCall(18, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenedLength(value) {
        result := ComCall(19, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ClosedLength() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ClosedLength(value) {
        result := ComCall(21, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OffsetFromCenter() {
        result := ComCall(22, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OffsetFromCenter(value) {
        result := ComCall(23, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentTranslationDirection() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationDirection(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContentTranslationOffset() {
        result := ComCall(26, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationOffset(value) {
        result := ComCall(27, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
