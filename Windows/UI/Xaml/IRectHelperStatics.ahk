#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IRectHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRectHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{5ee163e4-c17e-494f-b580-2f0574fc3a15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Empty", "FromCoordinatesAndDimensions", "FromPoints", "FromLocationAndSize", "GetIsEmpty", "GetBottom", "GetLeft", "GetRight", "GetTop", "Contains", "Equals", "Intersect", "UnionWithPoint", "UnionWithRect"]

    /**
     * @type {RECT} 
     */
    Empty {
        get => this.get_Empty()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Empty() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {RECT} 
     */
    FromCoordinatesAndDimensions(x, y, width, height) {
        result_ := RECT()
        result := ComCall(7, this, "float", x, "float", y, "float", width, "float", height, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {POINT} point1 
     * @param {POINT} point2 
     * @returns {RECT} 
     */
    FromPoints(point1, point2) {
        result_ := RECT()
        result := ComCall(8, this, "ptr", point1, "ptr", point2, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {POINT} location_ 
     * @param {SIZE} size_ 
     * @returns {RECT} 
     */
    FromLocationAndSize(location_, size_) {
        result_ := RECT()
        result := ComCall(9, this, "ptr", location_, "ptr", size_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RECT} target 
     * @returns {Boolean} 
     */
    GetIsEmpty(target) {
        result := ComCall(10, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RECT} target 
     * @returns {Float} 
     */
    GetBottom(target) {
        result := ComCall(11, this, "ptr", target, "float*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Gets the left separator for the recognizer context.
     * @param {RECT} target 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getleftseparator
     */
    GetLeft(target) {
        result := ComCall(12, this, "ptr", target, "float*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Gets the right separator for the recognizer context.
     * @param {RECT} target 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getrightseparator
     */
    GetRight(target) {
        result := ComCall(13, this, "ptr", target, "float*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Examines the Z order of the child windows associated with the specified parent window and retrieves a handle to the child window at the top of the Z order.
     * @param {RECT} target 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-gettopwindow
     */
    GetTop(target) {
        result := ComCall(14, this, "ptr", target, "float*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * The ContainsPalette function determines whether a specified VIDEOINFOHEADER structure contains a palette.
     * @param {RECT} target 
     * @param {POINT} point_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/containspalette
     */
    Contains(target, point_) {
        result := ComCall(15, this, "ptr", target, "ptr", point_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RECT} target 
     * @param {RECT} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(16, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Intersect (MDX)
     * @remarks
     * The **Intersect** function returns the intersection of two sets. By default, the function removes duplicates from both sets prior to intersecting the sets. The two sets specified must have the same dimensionality.  
     *   
     *  The optional **ALL** flag retains duplicates. If **ALL** is specified, the **Intersect** function intersects nonduplicated elements as usual, and also intersects each duplicate in the first set that has a matching duplicate in the second set. The two sets specified must have the same dimensionality.
     * @param {RECT} target 
     * @param {RECT} rect_ 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/intersect-mdx
     */
    Intersect(target, rect_) {
        result_ := RECT()
        result := ComCall(17, this, "ptr", target, "ptr", rect_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Union  (MDX)
     * @remarks
     * *Set Expression 1*  
     *  A valid Multidimensional Expressions (MDX) expression that returns a set.  
     *   
     *  *Set Expression 2*  
     *  A valid Multidimensional Expressions (MDX) expression that returns a set.  
     *   
     *  This function returns the union of two or more specified sets. With the standard syntax and with alternate syntax 1, duplicates are eliminated by default. With the standard syntax, using the **ALL** flag keeps duplicates in the joined set. Duplicates are deleted from the tail of the set. With alternate syntax 2, duplicates are always retained.
     * @param {RECT} target 
     * @param {POINT} point_ 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/union-mdx
     */
    UnionWithPoint(target, point_) {
        result_ := RECT()
        result := ComCall(18, this, "ptr", target, "ptr", point_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Union  (MDX)
     * @remarks
     * *Set Expression 1*  
     *  A valid Multidimensional Expressions (MDX) expression that returns a set.  
     *   
     *  *Set Expression 2*  
     *  A valid Multidimensional Expressions (MDX) expression that returns a set.  
     *   
     *  This function returns the union of two or more specified sets. With the standard syntax and with alternate syntax 1, duplicates are eliminated by default. With the standard syntax, using the **ALL** flag keeps duplicates in the joined set. Duplicates are deleted from the tail of the set. With alternate syntax 2, duplicates are always retained.
     * @param {RECT} target 
     * @param {RECT} rect_ 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/union-mdx
     */
    UnionWithRect(target, rect_) {
        result_ := RECT()
        result := ComCall(19, this, "ptr", target, "ptr", rect_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
