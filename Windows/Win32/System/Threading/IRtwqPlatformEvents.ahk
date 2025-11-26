#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides events related platform work queue.
 * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nn-rtworkq-irtwqplatformevents
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class IRtwqPlatformEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRtwqPlatformEvents
     * @type {Guid}
     */
    static IID => Guid("{63d9255a-7ff1-4b61-8faf-ed6460dacf2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializationComplete", "ShutdownStart", "ShutdownComplete"]

    /**
     * Called after the platform has been initialized.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqplatformevents-initializationcomplete
     */
    InitializationComplete() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Called before the platform is about to shutdown.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqplatformevents-shutdownstart
     */
    ShutdownStart() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called after the platform has shutdown.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqplatformevents-shutdowncomplete
     */
    ShutdownComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
