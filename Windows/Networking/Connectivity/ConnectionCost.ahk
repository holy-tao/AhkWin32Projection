#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectionCost.ahk
#Include .\IConnectionCost2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Exposes cost and data plan constraint information for a network connection so apps can adapt data usage behavior.
 * @remarks
 * [ConnectionCost](connectioncost.md) instances come from  
 * [ConnectionProfile.GetConnectionCost](connectionprofile_getconnectioncost_2051899034.md). They describe cost policies,  
 * roaming state, plan limits, and background restrictions so applications can adjust transfer strategies.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectionCost extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectionCost

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectionCost.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the current network cost for a connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost.networkcosttype
     * @type {Integer} 
     */
    NetworkCostType {
        get => this.get_NetworkCostType()
    }

    /**
     * Gets a value that indicates whether the connection is connected to a network outside of the home provider.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost.roaming
     * @type {Boolean} 
     */
    Roaming {
        get => this.get_Roaming()
    }

    /**
     * Gets a value that indicates if the connection has exceeded the data usage allowance specified by the data plan.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost.overdatalimit
     * @type {Boolean} 
     */
    OverDataLimit {
        get => this.get_OverDataLimit()
    }

    /**
     * Gets a value that indicates if a connection is approaching the data usage allowance specified by the data plan.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost.approachingdatalimit
     * @type {Boolean} 
     */
    ApproachingDataLimit {
        get => this.get_ApproachingDataLimit()
    }

    /**
     * Gets a value that indicates whether background data usage has been restricted.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectioncost.backgrounddatausagerestricted
     * @type {Boolean} 
     */
    BackgroundDataUsageRestricted {
        get => this.get_BackgroundDataUsageRestricted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCostType() {
        if (!this.HasProp("__IConnectionCost")) {
            if ((queryResult := this.QueryInterface(IConnectionCost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionCost := IConnectionCost(outPtr)
        }

        return this.__IConnectionCost.get_NetworkCostType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Roaming() {
        if (!this.HasProp("__IConnectionCost")) {
            if ((queryResult := this.QueryInterface(IConnectionCost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionCost := IConnectionCost(outPtr)
        }

        return this.__IConnectionCost.get_Roaming()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OverDataLimit() {
        if (!this.HasProp("__IConnectionCost")) {
            if ((queryResult := this.QueryInterface(IConnectionCost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionCost := IConnectionCost(outPtr)
        }

        return this.__IConnectionCost.get_OverDataLimit()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ApproachingDataLimit() {
        if (!this.HasProp("__IConnectionCost")) {
            if ((queryResult := this.QueryInterface(IConnectionCost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionCost := IConnectionCost(outPtr)
        }

        return this.__IConnectionCost.get_ApproachingDataLimit()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BackgroundDataUsageRestricted() {
        if (!this.HasProp("__IConnectionCost2")) {
            if ((queryResult := this.QueryInterface(IConnectionCost2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionCost2 := IConnectionCost2(outPtr)
        }

        return this.__IConnectionCost2.get_BackgroundDataUsageRestricted()
    }

;@endregion Instance Methods
}
