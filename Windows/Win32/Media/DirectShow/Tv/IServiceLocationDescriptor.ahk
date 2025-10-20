#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets information from the Service Location Descriptor in an Advanced Television Systems Committee (ATSC) Virtual Channel Table (VCT).
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iservicelocationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IServiceLocationDescriptor extends IUnknown{
    /**
     * The interface identifier for IServiceLocationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{58c3c827-9d91-4215-bff3-820a49f0904c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetPCR_PID(pwVal) {
        result := ComCall(3, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetNumberOfElements(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetElementStreamType(bIndex, pbVal) {
        result := ComCall(5, this, "char", bIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetElementPID(bIndex, pwVal) {
        result := ComCall(6, this, "char", bIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Byte>} LangCode 
     * @returns {HRESULT} 
     */
    GetElementLanguageCode(bIndex, LangCode) {
        result := ComCall(7, this, "char", bIndex, "char*", LangCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
