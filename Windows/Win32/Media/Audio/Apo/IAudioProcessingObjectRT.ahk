#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APO_CONNECTION_PROPERTY.ahk" { APO_CONNECTION_PROPERTY }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface can operate in real-time mode and its methods can be called form real-time processing threads.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobjectrt
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioProcessingObjectRT extends IUnknown {
    /**
     * The interface identifier for IAudioProcessingObjectRT
     * @type {Guid}
     */
    static IID := Guid("{9e1d6a6d-ddbc-4e95-a4c7-ad64ba37846c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioProcessingObjectRT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        APOProcess       : IntPtr
        CalcInputFrames  : IntPtr
        CalcOutputFrames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioProcessingObjectRT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The APOProcess method causes the APO to make a processing pass.
     * @remarks
     * The <c>APOProcess</c> method must not change the data in the ppOutputConnections array. But it must set the properties of the output connections after processing.
     * 
     * The <c>APOProcess</c> method is called from a real-time processing thread. The implementation of this method must not touch paged memory and it should not call any system blocking routines.
     * 
     * For a detailed look at an implementation of this method, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/windows-vista-sapo-feature-reference">Swap sample code</a> and refer to the Swapapolfx.cpp file.
     * @param {Integer} u32NumInputConnections The number of input connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_PROPERTY>>} ppInputConnections An array of input connection property structures. There is one structure per input connection.
     * @param {Integer} u32NumOutputConnections The number of output connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_PROPERTY>>} ppOutputConnections An array of output connection property structures. There is one structure per output connection.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-apoprocess
     */
    APOProcess(u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections) {
        ppInputConnectionsMarshal := ppInputConnections is VarRef ? "ptr*" : "ptr"
        ppOutputConnectionsMarshal := ppOutputConnections is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, "uint", u32NumInputConnections, ppInputConnectionsMarshal, ppInputConnections, "uint", u32NumOutputConnections, ppOutputConnectionsMarshal, ppOutputConnections)
    }

    /**
     * The CalcInputFrames method returns the number of input frames that an APO requires to generate a given number of output frames.
     * @remarks
     * The <c>CalcInputFrames</c> method is called from a real-time processing thread. The implementation of this method must not touch paged memory and it should not call any system blocking routines.
     * @param {Integer} u32OutputFrameCount This is a count of the number of output frames.
     * @returns {Integer} The <c>CalcInputFrames</c> method returns the number of input frames that are required to generate the given number of output frames.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-calcinputframes
     */
    CalcInputFrames(u32OutputFrameCount) {
        result := ComCall(4, this, "uint", u32OutputFrameCount, UInt32)
        return result
    }

    /**
     * The CalcOutputFrames method returns the number of output frames that an APO requires for a given number of input frames.
     * @remarks
     * The <c>CalcOutputFrames</c> method can be called form a real-time processing thread. The implementation of this method must not block or touch paged memory and it should not call any system blocking routines.
     * @param {Integer} u32InputFrameCount This is a count of the number of input frames.
     * @returns {Integer} The <c>CalcOutputFrames</c> method returns the number of output frames that an APO will generate for a given number of input frames.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-calcoutputframes
     */
    CalcOutputFrames(u32InputFrameCount) {
        result := ComCall(5, this, "uint", u32InputFrameCount, UInt32)
        return result
    }

    Query(iid) {
        if (IAudioProcessingObjectRT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.APOProcess := CallbackCreate(GetMethod(implObj, "APOProcess"), flags, 5)
        this.vtbl.CalcInputFrames := CallbackCreate(GetMethod(implObj, "CalcInputFrames"), flags, 2)
        this.vtbl.CalcOutputFrames := CallbackCreate(GetMethod(implObj, "CalcOutputFrames"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.APOProcess)
        CallbackFree(this.vtbl.CalcInputFrames)
        CallbackFree(this.vtbl.CalcOutputFrames)
    }
}
