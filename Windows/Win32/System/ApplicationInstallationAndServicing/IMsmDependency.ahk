#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmDependency interface retrieves details for a single module dependency.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmdependency
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmDependency extends IDispatch{
    /**
     * The interface identifier for IMsmDependency
     * @type {Guid}
     */
    static IID => Guid("{0adda82b-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} Module 
     * @returns {HRESULT} 
     */
    get_Module(Module) {
        result := ComCall(7, this, "ptr", Module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} Language 
     * @returns {HRESULT} 
     */
    get_Language(Language) {
        result := ComCall(8, this, "short*", Language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Version 
     * @returns {HRESULT} 
     */
    get_Version(Version) {
        result := ComCall(9, this, "ptr", Version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
