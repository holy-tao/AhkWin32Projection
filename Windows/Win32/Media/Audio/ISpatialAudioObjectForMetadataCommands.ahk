#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpatialAudioObjectBase.ahk" { ISpatialAudioObjectBase }

/**
 * Used to write metadata commands for spatial audio.
 * @remarks
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadatacommands
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioObjectForMetadataCommands extends ISpatialAudioObjectBase {
    /**
     * The interface identifier for ISpatialAudioObjectForMetadataCommands
     * @type {Guid}
     */
    static IID := Guid("{0df2c94b-f5f9-472d-af6b-c46e0ac9cd05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioObjectForMetadataCommands interfaces
    */
    struct Vtbl extends ISpatialAudioObjectBase.Vtbl {
        WriteNextMetadataCommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioObjectForMetadataCommands.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Writes a metadata command to the spatial audio object, each command may only be added once per object per processing cycle.
     * @param {Integer} commandID The ID of the metadata command.
     * @param {Integer} valueBuffer The buffer containing the value data for the metadata command.
     * @param {Integer} valueBufferLength The length of the <i>valueBuffer</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectformetadatacommands-writenextmetadatacommand
     */
    WriteNextMetadataCommand(commandID, valueBuffer, valueBufferLength) {
        result := ComCall(7, this, "char", commandID, "ptr", valueBuffer, "uint", valueBufferLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpatialAudioObjectForMetadataCommands.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteNextMetadataCommand := CallbackCreate(GetMethod(implObj, "WriteNextMetadataCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteNextMetadataCommand)
    }
}
