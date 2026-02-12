#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the SymEnumSourceFileTokens function which enumerates the source server version control information stored in the PDB for a module.
 * @remarks
 * An application can use this token to extract a source file from version control by calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsourcefilefromtoken">SymGetSourceFileFromToken</a>.  
 * 
 * To get individual variables from the token, call <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsourcevarfromtoken">SymGetSourceVarFromToken</a>.  The names of the variables differ based on the scripts used to create the tokens.  See <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">Source Server</a> for details.
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-penumsourcefiletokenscallback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PENUMSOURCEFILETOKENSCALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} token 
     * @param {Pointer} size_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(token, size_) {
        tokenMarshal := token is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, tokenMarshal, token, "ptr", size_, "int")
        return result
    }
}
