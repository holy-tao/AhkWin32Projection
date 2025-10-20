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
     * 
     * @param {Pointer<Int32>} PID 
     * @returns {HRESULT} 
     */
    get_PID(PID) {
        result := ComCall(16, this, "int*", PID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PID 
     * @returns {HRESULT} 
     */
    put_PID(PID) {
        result := ComCall(17, this, "int", PID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} PCRPID 
     * @returns {HRESULT} 
     */
    get_PCRPID(PCRPID) {
        result := ComCall(18, this, "int*", PCRPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PCRPID 
     * @returns {HRESULT} 
     */
    put_PCRPID(PCRPID) {
        result := ComCall(19, this, "int", PCRPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ProgramNumber 
     * @returns {HRESULT} 
     */
    get_ProgramNumber(ProgramNumber) {
        result := ComCall(20, this, "int*", ProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProgramNumber 
     * @returns {HRESULT} 
     */
    put_ProgramNumber(ProgramNumber) {
        result := ComCall(21, this, "int", ProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
