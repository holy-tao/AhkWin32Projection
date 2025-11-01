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
     * 
     * @param {Pointer<Integer>} OutputPinCount 
     * @param {Pointer<Integer>} InputPinCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_pincounts
     */
    get_PinCounts(OutputPinCount, InputPinCount) {
        OutputPinCountMarshal := OutputPinCount is VarRef ? "int*" : "ptr"
        InputPinCountMarshal := InputPinCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, OutputPinCountMarshal, OutputPinCount, InputPinCountMarshal, InputPinCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Integer} InputPinIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-canroute
     */
    CanRoute(OutputPinIndex, InputPinIndex) {
        result := ComCall(4, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Integer} InputPinIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-route
     */
    Route(OutputPinIndex, InputPinIndex) {
        result := ComCall(5, this, "int", OutputPinIndex, "int", InputPinIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputPinIndex 
     * @param {Pointer<Integer>} InputPinIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_isroutedto
     */
    get_IsRoutedTo(OutputPinIndex, InputPinIndex) {
        InputPinIndexMarshal := InputPinIndex is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", OutputPinIndex, InputPinIndexMarshal, InputPinIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsInputPin 
     * @param {Integer} PinIndex 
     * @param {Pointer<Integer>} PinIndexRelated 
     * @param {Pointer<Integer>} PhysicalType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcrossbar-get_crossbarpininfo
     */
    get_CrossbarPinInfo(IsInputPin, PinIndex, PinIndexRelated, PhysicalType) {
        PinIndexRelatedMarshal := PinIndexRelated is VarRef ? "int*" : "ptr"
        PhysicalTypeMarshal := PhysicalType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", IsInputPin, "int", PinIndex, PinIndexRelatedMarshal, PinIndexRelated, PhysicalTypeMarshal, PhysicalType, "HRESULT")
        return result
    }
}
