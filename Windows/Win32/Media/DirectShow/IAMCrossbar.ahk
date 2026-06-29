#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMCrossbar interface routes signals from an analog or digital source to a video capture filter.This interface is implemented by the Analog Video Crossbar Filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamcrossbar
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMCrossbar extends IUnknown {
    /**
     * The interface identifier for IAMCrossbar
     * @type {Guid}
     */
    static IID := Guid("{c6e13380-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMCrossbar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PinCounts       : IntPtr
        CanRoute            : IntPtr
        Route               : IntPtr
        get_IsRoutedTo      : IntPtr
        get_CrossbarPinInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMCrossbar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_PinCounts method retrieves the number of input and output pins on the crossbar filter.
     * @remarks
     * The other <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcrossbar">IAMCrossbar</a> methods take parameters that specify pins by index number. For these methods, output pins and input pins are both indexed from zero. Use the <c>get_PinCounts</c> method to determine the upper bounds for each.
     * @param {Pointer<Integer>} OutputPinCount Pointer to variable that receives the number of output pins.
     * @param {Pointer<Integer>} InputPinCount Pointer to variable that receives the number of input pins.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_pincounts
     */
    get_PinCounts(OutputPinCount, InputPinCount) {
        OutputPinCountMarshal := OutputPinCount is VarRef ? "int*" : "ptr"
        InputPinCountMarshal := InputPinCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, OutputPinCountMarshal, OutputPinCount, InputPinCountMarshal, InputPinCount, "HRESULT")
        return result
    }

    /**
     * The CanRoute method queries whether a specified input pin can be routed to a specified output pin.
     * @remarks
     * To route the pins, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcrossbar-route">IAMCrossbar::Route</a> method. Output pins and input pins are both indexed from zero. To determine the number of output and input pins, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcrossbar-get_pincounts">IAMCrossbar::get_PinCounts</a> method.
     * @param {Integer} OutputPinIndex Specifies the index of the output pin.
     * @param {Integer} InputPinIndex Specifies the index of input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> values. Possible values include the following.
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
     * These two pins can be routed.
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
     * These two pins cannot be routed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-canroute
     */
    CanRoute(OutputPinIndex, InputPinIndex) {
        result := ComCall(4, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * The Route method routes an input pin to an output pin.
     * @remarks
     * Routing two pins causes the output pin to deliver data from that input pin. Only one input pin at a time can be routed to a given output pin.
     * 
     * Output pins and input pins are both indexed from zero. To determine the number of output and input pins, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcrossbar-get_pincounts">IAMCrossbar::get_PinCounts</a> method.
     * @param {Integer} OutputPinIndex Specifies the index of the output pin.
     * @param {Integer} InputPinIndex Specifies the index of the input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot route these two pins.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-route
     */
    Route(OutputPinIndex, InputPinIndex) {
        result := ComCall(5, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * The get_IsRoutedTo method retrieves the input pin that is currently routed to the specified output pin.
     * @remarks
     * Output pins and input pins are both indexed from zero. To determine the number of output and input pins, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcrossbar-get_pincounts">IAMCrossbar::get_PinCounts</a> method.
     * @param {Integer} OutputPinIndex Specifies the index of the output pin.
     * @returns {Integer} Pointer to a variable that receives the index of the input pin, or -1 if no input pin is routed to this output pin.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_isroutedto
     */
    get_IsRoutedTo(OutputPinIndex) {
        result := ComCall(6, this, "int", OutputPinIndex, "int*", &InputPinIndex := 0, "HRESULT")
        return InputPinIndex
    }

    /**
     * The get_CrossbarPinInfo method retrieves information about a specified pin.
     * @remarks
     * Output pins and input pins are both indexed from zero. To determine the number of output and input pins, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcrossbar-get_pincounts">IAMCrossbar::get_PinCounts</a> method.
     * @param {BOOL} IsInputPin 
     * @param {Integer} PinIndex Specifies the index of the pin.
     * @param {Pointer<Integer>} PinIndexRelated Pointer to a variable that receives the index of the related pin, or –1 if no pin is related to this pin. The <i>related pin</i> is a pin on the same filter, with the same direction; it typically represents the same physical jack or connector. For example, a video tuner and an audio tuner might be related pins. Typically, if two pins are related, you should route them together.
     * @param {Pointer<Integer>} PhysicalType Pointer to a variable that receives a member of the [PhysicalConnectorType](/windows/desktop/api/strmif/ne-strmif-physicalconnectortype) enumeration, indicating the pin's physical type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown physical type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_crossbarpininfo
     */
    get_CrossbarPinInfo(IsInputPin, PinIndex, PinIndexRelated, PhysicalType) {
        PinIndexRelatedMarshal := PinIndexRelated is VarRef ? "int*" : "ptr"
        PhysicalTypeMarshal := PhysicalType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, BOOL, IsInputPin, "int", PinIndex, PinIndexRelatedMarshal, PinIndexRelated, PhysicalTypeMarshal, PhysicalType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMCrossbar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PinCounts := CallbackCreate(GetMethod(implObj, "get_PinCounts"), flags, 3)
        this.vtbl.CanRoute := CallbackCreate(GetMethod(implObj, "CanRoute"), flags, 3)
        this.vtbl.Route := CallbackCreate(GetMethod(implObj, "Route"), flags, 3)
        this.vtbl.get_IsRoutedTo := CallbackCreate(GetMethod(implObj, "get_IsRoutedTo"), flags, 3)
        this.vtbl.get_CrossbarPinInfo := CallbackCreate(GetMethod(implObj, "get_CrossbarPinInfo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PinCounts)
        CallbackFree(this.vtbl.CanRoute)
        CallbackFree(this.vtbl.Route)
        CallbackFree(this.vtbl.get_IsRoutedTo)
        CallbackFree(this.vtbl.get_CrossbarPinInfo)
    }
}
