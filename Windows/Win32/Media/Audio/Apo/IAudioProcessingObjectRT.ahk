#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This interface can operate in real-time mode and its methods can be called form real-time processing threads.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobjectrt
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectRT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectRT
     * @type {Guid}
     */
    static IID => Guid("{9e1d6a6d-ddbc-4e95-a4c7-ad64ba37846c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["APOProcess", "CalcInputFrames", "CalcOutputFrames"]

    /**
     * The APOProcess method causes the APO to make a processing pass.
     * @param {Integer} u32NumInputConnections The number of input connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_PROPERTY>>} ppInputConnections An array of input connection property structures. There is one structure per input connection.
     * @param {Integer} u32NumOutputConnections The number of output connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_PROPERTY>>} ppOutputConnections An array of output connection property structures. There is one structure per output connection.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-apoprocess
     */
    APOProcess(u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections) {
        ppInputConnectionsMarshal := ppInputConnections is VarRef ? "ptr*" : "ptr"
        ppOutputConnectionsMarshal := ppOutputConnections is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, "uint", u32NumInputConnections, ppInputConnectionsMarshal, ppInputConnections, "uint", u32NumOutputConnections, ppOutputConnectionsMarshal, ppOutputConnections)
    }

    /**
     * The CalcInputFrames method returns the number of input frames that an APO requires to generate a given number of output frames.
     * @param {Integer} u32OutputFrameCount This is a count of the number of output frames.
     * @returns {Integer} The <code>CalcInputFrames</code> method returns the number of input frames that are required to generate the given number of output frames.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-calcinputframes
     */
    CalcInputFrames(u32OutputFrameCount) {
        result := ComCall(4, this, "uint", u32OutputFrameCount, "uint")
        return result
    }

    /**
     * The CalcOutputFrames method returns the number of output frames that an APO requires for a given number of input frames.
     * @param {Integer} u32InputFrameCount This is a count of the number of input frames.
     * @returns {Integer} The <code>CalcOutputFrames</code> method returns the number of output frames that an APO will generate for a given number of input frames.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-calcoutputframes
     */
    CalcOutputFrames(u32InputFrameCount) {
        result := ComCall(5, this, "uint", u32InputFrameCount, "uint")
        return result
    }
}
