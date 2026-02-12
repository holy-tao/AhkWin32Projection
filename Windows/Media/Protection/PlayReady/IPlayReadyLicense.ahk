#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains information about a PlayReady license.
 * @remarks
 * This interface could represent a single license or an entire chain of licenses depending on how the license enumeration was performed.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicense extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicense
     * @type {Guid}
     */
    static IID => Guid("{ee474c4e-fa3c-414d-a9f2-3ffc1ef832d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FullyEvaluated", "get_UsableForPlay", "get_ExpirationDate", "get_ExpireAfterFirstPlay", "get_DomainAccountID", "get_ChainDepth", "GetKIDAtChainDepth"]

    /**
     * Gets the state of the license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.fullyevaluated
     * @type {Boolean} 
     */
    FullyEvaluated {
        get => this.get_FullyEvaluated()
    }

    /**
     * Gets whether this license is usable for playback.
     * @remarks
     * Many factors influence the ability to use a license. This property makes a determination based on the state of the PlayReady system and does not factor into account various issues such as video driver support.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.usableforplay
     * @type {Boolean} 
     */
    UsableForPlay {
        get => this.get_UsableForPlay()
    }

    /**
     * Gets the expiration date of the current license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.expirationdate
     * @type {IReference<DateTime>} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets the amount of time, in seconds, before the current license expires after the media is first played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.expireafterfirstplay
     * @type {Integer} 
     */
    ExpireAfterFirstPlay {
        get => this.get_ExpireAfterFirstPlay()
    }

    /**
     * Gets the domain account identifier to which this license is bound.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.domainaccountid
     * @type {Guid} 
     */
    DomainAccountID {
        get => this.get_DomainAccountID()
    }

    /**
     * Gets the chain depth of the license chain represented by the current [IPlayReadyLicense](iplayreadylicense.md) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.chaindepth
     * @type {Integer} 
     */
    ChainDepth {
        get => this.get_ChainDepth()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FullyEvaluated() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UsableForPlay() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationDate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpireAfterFirstPlay() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainAccountID() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChainDepth() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the key identifier (KID) of the license at the specified chain depth.
     * @remarks
     * The *chainDepth* parameter must be between the value of 0 and ([IPlayReadyLicense.ChainDepth](iplayreadylicense_chaindepth.md) - 1).
     * @param {Integer} chainDepth The depth of the license in the chain for which to retrieve the KID. This value is a 0-based index.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicense.getkidatchaindepth
     */
    GetKIDAtChainDepth(chainDepth) {
        kid := Guid()
        result := ComCall(12, this, "uint", chainDepth, "ptr", kid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return kid
    }
}
