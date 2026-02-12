#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\UIElement.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IVisualTreeHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{e75758c4-d25d-4b1d-971f-596f17f12baa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindElementsInHostCoordinatesPoint", "FindElementsInHostCoordinatesRect", "FindAllElementsInHostCoordinatesPoint", "FindAllElementsInHostCoordinatesRect", "GetChild", "GetChildrenCount", "GetParent", "DisconnectChildrenRecursive"]

    /**
     * 
     * @param {POINT} intersectingPoint 
     * @param {UIElement} subtree 
     * @returns {IIterable<UIElement>} 
     */
    FindElementsInHostCoordinatesPoint(intersectingPoint, subtree) {
        result := ComCall(6, this, "ptr", intersectingPoint, "ptr", subtree, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(UIElement, result_)
    }

    /**
     * 
     * @param {RECT} intersectingRect 
     * @param {UIElement} subtree 
     * @returns {IIterable<UIElement>} 
     */
    FindElementsInHostCoordinatesRect(intersectingRect, subtree) {
        result := ComCall(7, this, "ptr", intersectingRect, "ptr", subtree, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(UIElement, result_)
    }

    /**
     * 
     * @param {POINT} intersectingPoint 
     * @param {UIElement} subtree 
     * @param {Boolean} includeAllElements 
     * @returns {IIterable<UIElement>} 
     */
    FindAllElementsInHostCoordinatesPoint(intersectingPoint, subtree, includeAllElements) {
        result := ComCall(8, this, "ptr", intersectingPoint, "ptr", subtree, "int", includeAllElements, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(UIElement, result_)
    }

    /**
     * 
     * @param {RECT} intersectingRect 
     * @param {UIElement} subtree 
     * @param {Boolean} includeAllElements 
     * @returns {IIterable<UIElement>} 
     */
    FindAllElementsInHostCoordinatesRect(intersectingRect, subtree, includeAllElements) {
        result := ComCall(9, this, "ptr", intersectingRect, "ptr", subtree, "int", includeAllElements, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(UIElement, result_)
    }

    /**
     * GetChildren Method (ADO)
     * @remarks
     * The provider determines what columns exist in the returned **Recordset**. For example, a document source provider always returns a resource **Recordset**.
     * @param {DependencyObject} reference_ 
     * @param {Integer} childIndex 
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getchildren-method-ado
     */
    GetChild(reference_, childIndex) {
        result := ComCall(10, this, "ptr", reference_, "int", childIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} reference_ 
     * @returns {Integer} 
     */
    GetChildrenCount(reference_) {
        result := ComCall(11, this, "ptr", reference_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @param {DependencyObject} reference_ 
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getparent
     */
    GetParent(reference_) {
        result := ComCall(12, this, "ptr", reference_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {HRESULT} 
     */
    DisconnectChildrenRecursive(element) {
        result := ComCall(13, this, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
