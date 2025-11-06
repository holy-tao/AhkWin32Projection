#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbLogicalChannelDescriptor.ahk

/**
 * The IDvbLogicalChannelDescriptor2 interface enables the client to get a logical channel descriptor from a DVB stream. The logical channel descriptor may be present in the network information table (NIT).
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvblogicalchanneldescriptor2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbLogicalChannelDescriptor2 extends IDvbLogicalChannelDescriptor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbLogicalChannelDescriptor2
     * @type {Guid}
     */
    static IID => Guid("{43aca974-4be8-4b98-bc17-9eafd788b1d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRecordLogicalChannelAndVisibility"]

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     */
    GetRecordLogicalChannelAndVisibility(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }
}
