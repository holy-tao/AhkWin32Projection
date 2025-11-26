#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbhierarchicaltransmissiondescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbHierarchicalTransmissionDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbHierarchicalTransmissionDescriptor
     * @type {Guid}
     */
    static IID => Guid("{b7b3ae90-ee0b-446d-8769-f7e2aa266aa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetFutureUse1", "GetQualityLevel", "GetFutureUse2", "GetReferencePid"]

    /**
     * Gets the tag that identifies a hierarchical transmission descriptor.
     * @returns {Integer} Receives the tag value. For hierarchical transmission descriptors, this value is 0xC0.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the 7-bit reserved_future_use field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
     * @returns {Integer} Receives the 7-bit reserved_future_use field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getfutureuse1
     */
    GetFutureUse1() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the quality_flag field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor. This field indicates the quality level of the hierarchical stream construction.
     * @returns {Integer} Receives the quality_flag field value. A value of 1 indicates a high-quality stream; a value of 0 indicates a low-quality stream.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getqualitylevel
     */
    GetQualityLevel() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the 3-bit reserved_future_use field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
     * @returns {Integer} Receives the 3-bit reserved_future_use field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getfutureuse2
     */
    GetFutureUse2() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the program ID (PID) of the primary hierarchical stream from a hierarchical transmission descriptor.
     * @returns {Integer} Receives the PID value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getreferencepid
     */
    GetReferencePid() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }
}
