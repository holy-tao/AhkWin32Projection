#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbdigitalcopycontroldescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDigitalCopyControlDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbDigitalCopyControlDescriptor
     * @type {Guid}
     */
    static IID => Guid("{1a28417e-266a-4bb8-a4bd-d782bcfb8161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCopyControl", "GetCountOfRecords", "GetRecordCopyControl"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<Integer>} pbDigitalRecordingControlData 
     * @param {Pointer<Integer>} pbCopyControlType 
     * @param {Pointer<Integer>} pbAPSControlData 
     * @param {Pointer<Integer>} pbMaximumBitrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcopycontrol
     */
    GetCopyControl(pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        pbDigitalRecordingControlDataMarshal := pbDigitalRecordingControlData is VarRef ? "char*" : "ptr"
        pbCopyControlTypeMarshal := pbCopyControlType is VarRef ? "char*" : "ptr"
        pbAPSControlDataMarshal := pbAPSControlData is VarRef ? "char*" : "ptr"
        pbMaximumBitrateMarshal := pbMaximumBitrate is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbDigitalRecordingControlDataMarshal, pbDigitalRecordingControlData, pbCopyControlTypeMarshal, pbCopyControlType, pbAPSControlDataMarshal, pbAPSControlData, pbMaximumBitrateMarshal, pbMaximumBitrate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbComponentTag 
     * @param {Pointer<Integer>} pbDigitalRecordingControlData 
     * @param {Pointer<Integer>} pbCopyControlType 
     * @param {Pointer<Integer>} pbAPSControlData 
     * @param {Pointer<Integer>} pbMaximumBitrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getrecordcopycontrol
     */
    GetRecordCopyControl(bRecordIndex, pbComponentTag, pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        pbComponentTagMarshal := pbComponentTag is VarRef ? "char*" : "ptr"
        pbDigitalRecordingControlDataMarshal := pbDigitalRecordingControlData is VarRef ? "char*" : "ptr"
        pbCopyControlTypeMarshal := pbCopyControlType is VarRef ? "char*" : "ptr"
        pbAPSControlDataMarshal := pbAPSControlData is VarRef ? "char*" : "ptr"
        pbMaximumBitrateMarshal := pbMaximumBitrate is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pbComponentTagMarshal, pbComponentTag, pbDigitalRecordingControlDataMarshal, pbDigitalRecordingControlData, pbCopyControlTypeMarshal, pbCopyControlType, pbAPSControlDataMarshal, pbAPSControlData, pbMaximumBitrateMarshal, pbMaximumBitrate, "HRESULT")
        return result
    }
}
