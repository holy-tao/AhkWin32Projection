#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCrossbar interface routes signals from an analog or digital source to a video capture filter.This interface is implemented by the Analog Video Crossbar Filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcrossbar
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCrossbar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMCrossbar
     * @type {Guid}
     */
    static IID => Guid("{c6e13380-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinCounts", "CanRoute", "Route", "get_IsRoutedTo", "get_CrossbarPinInfo"]

    /**
     * The get_PinCounts method retrieves the number of input and output pins on the crossbar filter.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcrossbar-get_pincounts
     */
    get_PinCounts(OutputPinCount, InputPinCount) {
        OutputPinCountMarshal := OutputPinCount is VarRef ? "int*" : "ptr"
        InputPinCountMarshal := InputPinCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, OutputPinCountMarshal, OutputPinCount, InputPinCountMarshal, InputPinCount, "HRESULT")
        return result
    }

    /**
     * The CanRoute method queries whether a specified input pin can be routed to a specified output pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcrossbar-canroute
     */
    CanRoute(OutputPinIndex, InputPinIndex) {
        result := ComCall(4, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * The Route method routes an input pin to an output pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcrossbar-route
     */
    Route(OutputPinIndex, InputPinIndex) {
        result := ComCall(5, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * The get_IsRoutedTo method retrieves the input pin that is currently routed to the specified output pin.
     * @param {Integer} OutputPinIndex Specifies the index of the output pin.
     * @returns {Integer} Pointer to a variable that receives the index of the input pin, or -1 if no input pin is routed to this output pin.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcrossbar-get_isroutedto
     */
    get_IsRoutedTo(OutputPinIndex) {
        result := ComCall(6, this, "int", OutputPinIndex, "int*", &InputPinIndex := 0, "HRESULT")
        return InputPinIndex
    }

    /**
     * The get_CrossbarPinInfo method retrieves information about a specified pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcrossbar-get_crossbarpininfo
     */
    get_CrossbarPinInfo(IsInputPin, PinIndex, PinIndexRelated, PhysicalType) {
        PinIndexRelatedMarshal := PinIndexRelated is VarRef ? "int*" : "ptr"
        PhysicalTypeMarshal := PhysicalType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", IsInputPin, "int", PinIndex, PinIndexRelatedMarshal, PinIndexRelated, PhysicalTypeMarshal, PhysicalType, "HRESULT")
        return result
    }
}
