#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Controls the DirectML debug layers.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmldebugdevice
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDebugDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLDebugDevice
     * @type {Guid}
     */
    static IID => Guid("{7d6f3ac9-394a-4ac3-92a7-390cc57a8217}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMuteDebugOutput"]

    /**
     * Determine whether to mute DirectML from sending messages to the ID3D12InfoQueue.
     * @param {BOOL} mute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, DirectML is muted, and it will not send messages to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a>. If <b>FALSE</b>, DirectML is not muted, and it will send messages to the <b>ID3D12InfoQueue</b>. The default value is <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmldebugdevice-setmutedebugoutput
     */
    SetMuteDebugOutput(mute) {
        ComCall(3, this, "int", mute)
    }
}
