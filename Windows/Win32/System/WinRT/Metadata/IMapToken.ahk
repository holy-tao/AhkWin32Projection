#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMapToken extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapToken
     * @type {Guid}
     */
    static IID => Guid("{06a3ea8b-0225-11d1-bf72-00c04fc31e12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Map"]

    /**
     * Maps an image and preloads data from the mapped file.
     * @remarks
     * The 
     * <b>MapAndLoad</b> function maps an image and preloads data from the mapped file. The corresponding function, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-unmapandload">UnMapAndLoad</a>, must be used to deallocate all resources that are allocated by the 
     * <b>MapAndLoad</b> function.
     * 			
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Integer} tkImp 
     * @param {Integer} tkEmit 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-mapandload
     */
    Map(tkImp, tkEmit) {
        result := ComCall(3, this, "uint", tkImp, "uint", tkEmit, "HRESULT")
        return result
    }
}
