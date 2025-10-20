#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbLogicalChannelDescriptor2.ahk

/**
 * Implements the IDvbLogicalChannelDescriptor interface for Digital Video Broadcast (DVB) streams based on Motion Picture Experts Group Version 4 Advanced Video Coding (MPEG-4AVC) that support high-definition (HD) simulcasting.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbhdsimulcastlogicalchanneldescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbHDSimulcastLogicalChannelDescriptor extends IDvbLogicalChannelDescriptor2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbHDSimulcastLogicalChannelDescriptor
     * @type {Guid}
     */
    static IID => Guid("{1ea8b738-a307-4680-9e26-d0a908c824f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
