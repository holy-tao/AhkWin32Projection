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
     * Gets the program ID (PID) for the packets that contain the Program Clock Reference (PCR) in the transport stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @returns {Integer} Receives the PID value.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getpcr_pid
     */
    GetPCR_PID() {
        result := ComCall(3, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of elementary streams for an Advanced Television Systems Committee (ATSC) service location descriptor.
     * @returns {Integer} Receives the number of elementary streams.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements
     */
    GetNumberOfElements() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code identifying the type of an elementary stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a>method to get the number of elementary streams in the descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementstreamtype
     */
    GetElementStreamType(bIndex) {
        result := ComCall(5, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the program ID (PID) that identifies an elementary stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a>method to get the number of elementary streams in the descriptor.
     * @returns {Integer} Receives the PID value for the elementary stream.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementpid
     */
    GetElementPID(bIndex) {
        result := ComCall(6, this, "char", bIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the three-character ISO 639 language code for an Advanced Television Systems Committee (ATSC) service location descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a>method to get the number of elementary streams in the descriptor.
     * @returns {Integer} Pointer to a buffer that receives the language code. For a list of language codes, refer to <a href="http://www-01.sil.org/iso639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementlanguagecode
     */
    GetElementLanguageCode(bIndex) {
        result := ComCall(7, this, "char", bIndex, "char*", &LangCode := 0, "HRESULT")
        return LangCode
    }
}
