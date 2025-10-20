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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPCR_PID", "GetNumberOfElements", "GetElementStreamType", "GetElementPID", "GetElementLanguageCode"]

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getpcr_pid
     */
    GetPCR_PID(pwVal) {
        result := ComCall(3, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements
     */
    GetNumberOfElements(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementstreamtype
     */
    GetElementStreamType(bIndex, pbVal) {
        result := ComCall(5, this, "char", bIndex, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementpid
     */
    GetElementPID(bIndex, pwVal) {
        result := ComCall(6, this, "char", bIndex, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} LangCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementlanguagecode
     */
    GetElementLanguageCode(bIndex, LangCode) {
        result := ComCall(7, this, "char", bIndex, "char*", LangCode, "HRESULT")
        return result
    }
}
