#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMutualExclusion.ahk

/**
 * The IWMMutualExclusion2 interface provides advanced configuration features for mutual exclusion objects.This interface supports both multiple languages and advanced mutual exclusion.An IWMMutualExclusion2 interface is created for each mutual exclusion object created. To retrieve a pointer to an IWMMutualExclusion2 interface, call the QueryInterface method of the IWMMutualExclusion interface returned by IWMProfile::CreateNewMutualExclusion.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmutualexclusion2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMutualExclusion2 extends IWMMutualExclusion{
    /**
     * The interface identifier for IWMMutualExclusion2
     * @type {Guid}
     */
    static IID => Guid("{0302b57d-89d1-4ba2-85c9-166f2c53eb91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pcchName 
     * @returns {HRESULT} 
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "ushort*", pcchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(9, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwRecordCount 
     * @returns {HRESULT} 
     */
    GetRecordCount(pwRecordCount) {
        result := ComCall(10, this, "ushort*", pwRecordCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddRecord() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @returns {HRESULT} 
     */
    RemoveRecord(wRecordNumber) {
        result := ComCall(12, this, "ushort", wRecordNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {PWSTR} pwszRecordName 
     * @param {Pointer<UInt16>} pcchRecordName 
     * @returns {HRESULT} 
     */
    GetRecordName(wRecordNumber, pwszRecordName, pcchRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        result := ComCall(13, this, "ushort", wRecordNumber, "ptr", pwszRecordName, "ushort*", pcchRecordName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {PWSTR} pwszRecordName 
     * @returns {HRESULT} 
     */
    SetRecordName(wRecordNumber, pwszRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        result := ComCall(14, this, "ushort", wRecordNumber, "ptr", pwszRecordName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Pointer<UInt16>} pwStreamNumArray 
     * @param {Pointer<UInt16>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreamsForRecord(wRecordNumber, pwStreamNumArray, pcStreams) {
        result := ComCall(15, this, "ushort", wRecordNumber, "ushort*", pwStreamNumArray, "ushort*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     */
    AddStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(16, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     */
    RemoveStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(17, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
