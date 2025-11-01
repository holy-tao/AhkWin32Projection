#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IComponent.ahk

/**
 * The IMPEG2Component interface contains methods for getting and setting properties that describe an MPEG2 elementary stream.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2Component)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-impeg2component
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2Component extends IComponent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2Component
     * @type {Guid}
     */
    static IID => Guid("{1493e353-1eb6-473c-802d-8e6b8ec9d2a9}")

    /**
     * The class identifier for MPEG2Component
     * @type {Guid}
     */
    static CLSID => Guid("{055cb2d7-2969-45cd-914b-76890722f112}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PID", "put_PID", "get_PCRPID", "put_PCRPID", "get_ProgramNumber", "put_ProgramNumber"]

    /**
     * 
     * @param {Pointer<Integer>} PID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_pid
     */
    get_PID(PID) {
        result := ComCall(16, this, "int*", PID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_pid
     */
    put_PID(PID) {
        result := ComCall(17, this, "int", PID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PCRPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_pcrpid
     */
    get_PCRPID(PCRPID) {
        result := ComCall(18, this, "int*", PCRPID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PCRPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_pcrpid
     */
    put_PCRPID(PCRPID) {
        result := ComCall(19, this, "int", PCRPID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ProgramNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_programnumber
     */
    get_ProgramNumber(ProgramNumber) {
        result := ComCall(20, this, "int*", ProgramNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProgramNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_programnumber
     */
    put_ProgramNumber(ProgramNumber) {
        result := ComCall(21, this, "int", ProgramNumber, "HRESULT")
        return result
    }
}
