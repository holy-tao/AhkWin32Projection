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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
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
        result := ComCall(5, this, "char*", pbDigitalRecordingControlData, "char*", pbCopyControlType, "char*", pbAPSControlData, "char*", pbMaximumBitrate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
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
        result := ComCall(7, this, "char", bRecordIndex, "char*", pbComponentTag, "char*", pbDigitalRecordingControlData, "char*", pbCopyControlType, "char*", pbAPSControlData, "char*", pbMaximumBitrate, "HRESULT")
        return result
    }
}
