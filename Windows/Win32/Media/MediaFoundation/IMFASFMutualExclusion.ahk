#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures an Advanced Systems Format (ASF) mutual exclusion object, which manages information about a group of streams in an ASF profile that are mutually exclusive.
 * @remarks
 * 
  * An ASF profile object can support multiple mutual exclusions. Each must be configured using a separate ASF mutual exclusion object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfmutualexclusion
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFMutualExclusion extends IUnknown{
    /**
     * The interface identifier for IMFASFMutualExclusion
     * @type {Guid}
     */
    static IID => Guid("{12558291-e399-11d5-bc2a-00b0d0f3f4ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     */
    GetType(pguidType) {
        result := ComCall(3, this, "ptr", pguidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @returns {HRESULT} 
     */
    SetType(guidType) {
        result := ComCall(4, this, "ptr", guidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRecordCount 
     * @returns {HRESULT} 
     */
    GetRecordCount(pdwRecordCount) {
        result := ComCall(5, this, "uint*", pdwRecordCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Pointer<UInt16>} pwStreamNumArray 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreamsForRecord(dwRecordNumber, pwStreamNumArray, pcStreams) {
        result := ComCall(6, this, "uint", dwRecordNumber, "ushort*", pwStreamNumArray, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     */
    AddStreamForRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(7, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     */
    RemoveStreamFromRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(8, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @returns {HRESULT} 
     */
    RemoveRecord(dwRecordNumber) {
        result := ComCall(9, this, "uint", dwRecordNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRecordNumber 
     * @returns {HRESULT} 
     */
    AddRecord(pdwRecordNumber) {
        result := ComCall(10, this, "uint*", pdwRecordNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     */
    Clone(ppIMutex) {
        result := ComCall(11, this, "ptr", ppIMutex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
