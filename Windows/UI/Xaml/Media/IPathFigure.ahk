#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PathSegmentCollection.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPathFigure extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathFigure
     * @type {Guid}
     */
    static IID => Guid("{5d955c8c-5fa9-4dda-a3cc-10fcdcaa20d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Segments", "put_Segments", "get_StartPoint", "put_StartPoint", "get_IsClosed", "put_IsClosed", "get_IsFilled", "put_IsFilled"]

    /**
     * @type {PathSegmentCollection} 
     */
    Segments {
        get => this.get_Segments()
        set => this.put_Segments(value)
    }

    /**
     * @type {POINT} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

    /**
     * @type {Boolean} 
     */
    IsClosed {
        get => this.get_IsClosed()
        set => this.put_IsClosed(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFilled {
        get => this.get_IsFilled()
        set => this.put_IsFilled(value)
    }

    /**
     * 
     * @returns {PathSegmentCollection} 
     */
    get_Segments() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PathSegmentCollection(value)
    }

    /**
     * 
     * @param {PathSegmentCollection} value 
     * @returns {HRESULT} 
     */
    put_Segments(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_StartPoint() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_StartPoint(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClosed() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsClosed(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFilled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFilled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
