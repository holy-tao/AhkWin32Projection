#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumStreamBufferRecordingAttrib.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<STREAMBUFFER_ATTRIBUTE>} pStreamBufferAttribute 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-next
     */
    Next(cRequest, pStreamBufferAttribute) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamBufferAttribute, "uint*", &pcReceived := 0, "HRESULT")
        return pcReceived
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumStreamBufferRecordingAttrib} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }
}
