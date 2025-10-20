#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandStream extends IUnknown{
    /**
     * The interface identifier for ICommandStream
     * @type {Guid}
     */
    static IID => Guid("{0c733abf-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} piid 
     * @param {Pointer<Guid>} pguidDialect 
     * @param {Pointer<IUnknown>} ppCommandStream 
     * @returns {HRESULT} 
     */
    GetCommandStream(piid, pguidDialect, ppCommandStream) {
        result := ComCall(3, this, "ptr", piid, "ptr", pguidDialect, "ptr", ppCommandStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Guid>} rguidDialect 
     * @param {Pointer<IUnknown>} pCommandStream 
     * @returns {HRESULT} 
     */
    SetCommandStream(riid, rguidDialect, pCommandStream) {
        result := ComCall(4, this, "ptr", riid, "ptr", rguidDialect, "ptr", pCommandStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
