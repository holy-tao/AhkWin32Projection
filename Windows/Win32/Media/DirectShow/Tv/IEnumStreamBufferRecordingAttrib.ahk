#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumStreamBufferRecordingAttrib interface enumerates a collection of attributes on a stream buffer file.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumStreamBufferRecordingAttrib)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-ienumstreambufferrecordingattrib
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumStreamBufferRecordingAttrib extends IUnknown{
    /**
     * The interface identifier for IEnumStreamBufferRecordingAttrib
     * @type {Guid}
     */
    static IID => Guid("{c18a9162-1e82-4142-8c73-5690fa62fe33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<STREAMBUFFER_ATTRIBUTE>} pStreamBufferAttribute 
     * @param {Pointer<UInt32>} pcReceived 
     * @returns {HRESULT} 
     */
    Next(cRequest, pStreamBufferAttribute, pcReceived) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamBufferAttribute, "uint*", pcReceived, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStreamBufferRecordingAttrib>} ppIEnumStreamBufferAttrib 
     * @returns {HRESULT} 
     */
    Clone(ppIEnumStreamBufferAttrib) {
        result := ComCall(6, this, "ptr", ppIEnumStreamBufferAttrib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
