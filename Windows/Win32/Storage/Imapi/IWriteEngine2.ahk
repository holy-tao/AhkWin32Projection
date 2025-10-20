#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to write a data stream to a device.
 * @remarks
 * 
  * To create the <b>MsftWriteEngine2</b> object in a script, use IMAPI2.MsftWriteEngine2 as the program identifier when calling <b>CreateObject</b>.
  * 
  *  It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iwriteengine2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteEngine2 extends IDispatch{
    /**
     * The interface identifier for IWriteEngine2
     * @type {Guid}
     */
    static IID => Guid("{27354135-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IStream>} data 
     * @param {Integer} startingBlockAddress 
     * @param {Integer} numberOfBlocks 
     * @returns {HRESULT} 
     */
    WriteSection(data, startingBlockAddress, numberOfBlocks) {
        result := ComCall(7, this, "ptr", data, "int", startingBlockAddress, "int", numberOfBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelWrite() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2Ex>} value 
     * @returns {HRESULT} 
     */
    put_Recorder(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2Ex>} value 
     * @returns {HRESULT} 
     */
    get_Recorder(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_UseStreamingWrite12(value) {
        result := ComCall(11, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_UseStreamingWrite12(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartingSectorsPerSecond(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartingSectorsPerSecond(value) {
        result := ComCall(14, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EndingSectorsPerSecond(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_EndingSectorsPerSecond(value) {
        result := ComCall(16, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BytesPerSector(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_BytesPerSector(value) {
        result := ComCall(18, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_WriteInProgress(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
