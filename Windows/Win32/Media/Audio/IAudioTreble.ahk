#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPerChannelDbLevel.ahk

/**
 * The IAudioTreble interface provides access to a hardware treble-level control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiotreble
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioTreble extends IPerChannelDbLevel{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioTreble
     * @type {Guid}
     */
    static IID => Guid("{0a717812-694e-4907-b74b-bafa5cfdca7b}")

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
