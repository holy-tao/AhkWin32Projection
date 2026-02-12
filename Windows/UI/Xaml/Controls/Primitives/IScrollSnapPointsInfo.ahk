#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Describes snap point behavior for objects that contain and present items.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.iscrollsnappointsinfo
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IScrollSnapPointsInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollSnapPointsInfo
     * @type {Guid}
     */
    static IID => Guid("{1b5d1336-e61b-4d51-be41-fd8ddc55c58c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreHorizontalSnapPointsRegular", "get_AreVerticalSnapPointsRegular", "add_HorizontalSnapPointsChanged", "remove_HorizontalSnapPointsChanged", "add_VerticalSnapPointsChanged", "remove_VerticalSnapPointsChanged", "GetIrregularSnapPoints", "GetRegularSnapPoints"]

    /**
     * Gets a value that indicates whether the horizontal snap points for the container are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.iscrollsnappointsinfo.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that indicates whether the vertical snap points for the container are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.iscrollsnappointsinfo.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreHorizontalSnapPointsRegular() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreVerticalSnapPointsRegular() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HorizontalSnapPointsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HorizontalSnapPointsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VerticalSnapPointsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VerticalSnapPointsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the set of distances between irregular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation/dimension for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.iscrollsnappointsinfo.getirregularsnappoints
     */
    GetIrregularSnapPoints(orientation_, alignment) {
        result := ComCall(12, this, "int", orientation_, "int", alignment, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetSingle(), result_)
    }

    /**
     * Gets the distance between regular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation/dimension for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @param {Pointer<Single>} offset Out parameter. The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.iscrollsnappointsinfo.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        result := ComCall(13, this, "int", orientation_, "int", alignment, "ptr", offset, "float*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
