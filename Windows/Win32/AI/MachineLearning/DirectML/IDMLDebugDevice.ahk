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
     * 
     * @param {BOOL} mute 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldebugdevice-setmutedebugoutput
     */
    SetMuteDebugOutput(mute) {
        ComCall(3, this, "int", mute)
    }
}
