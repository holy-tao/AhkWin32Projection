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
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbDigitalRecordingControlData 
     * @param {Pointer<Byte>} pbCopyControlType 
     * @param {Pointer<Byte>} pbAPSControlData 
     * @param {Pointer<Byte>} pbMaximumBitrate 
     * @returns {HRESULT} 
     */
    GetCopyControl(pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        result := ComCall(5, this, "char*", pbDigitalRecordingControlData, "char*", pbCopyControlType, "char*", pbAPSControlData, "char*", pbMaximumBitrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Byte>} pbComponentTag 
     * @param {Pointer<Byte>} pbDigitalRecordingControlData 
     * @param {Pointer<Byte>} pbCopyControlType 
     * @param {Pointer<Byte>} pbAPSControlData 
     * @param {Pointer<Byte>} pbMaximumBitrate 
     * @returns {HRESULT} 
     */
    GetRecordCopyControl(bRecordIndex, pbComponentTag, pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", pbComponentTag, "char*", pbDigitalRecordingControlData, "char*", pbCopyControlType, "char*", pbAPSControlData, "char*", pbMaximumBitrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
