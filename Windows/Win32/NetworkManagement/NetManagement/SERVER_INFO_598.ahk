#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_598 {
    #StructPack 4

    sv598_maxrawworkitems : UInt32

    sv598_maxthreadsperqueue : UInt32

    sv598_producttype : UInt32

    sv598_serversize : UInt32

    sv598_connectionlessautodisc : UInt32

    sv598_sharingviolationretries : UInt32

    sv598_sharingviolationdelay : UInt32

    sv598_maxglobalopensearch : UInt32

    sv598_removeduplicatesearches : UInt32

    sv598_lockviolationoffset : UInt32

    sv598_lockviolationdelay : UInt32

    sv598_mdlreadswitchover : UInt32

    sv598_cachedopenlimit : UInt32

    sv598_otherqueueaffinity : UInt32

    sv598_restrictnullsessaccess : BOOL

    sv598_enablewfw311directipx : BOOL

    sv598_queuesamplesecs : UInt32

    sv598_balancecount : UInt32

    sv598_preferredaffinity : UInt32

    sv598_maxfreerfcbs : UInt32

    sv598_maxfreemfcbs : UInt32

    sv598_maxfreelfcbs : UInt32

    sv598_maxfreepagedpoolchunks : UInt32

    sv598_minpagedpoolchunksize : UInt32

    sv598_maxpagedpoolchunksize : UInt32

    sv598_sendsfrompreferredprocessor : BOOL

    sv598_cacheddirectorylimit : UInt32

    sv598_maxcopylength : UInt32

    sv598_enablecompression : BOOL

    sv598_autosharewks : BOOL

    sv598_autoshareserver : BOOL

    sv598_enablesecuritysignature : BOOL

    sv598_requiresecuritysignature : BOOL

    sv598_minclientbuffersize : UInt32

    sv598_serverguid : Guid

    sv598_ConnectionNoSessionsTimeout : UInt32

    sv598_IdleThreadTimeOut : UInt32

    sv598_enableW9xsecuritysignature : BOOL

    sv598_enforcekerberosreauthentication : BOOL

    sv598_disabledos : BOOL

    sv598_lowdiskspaceminimum : UInt32

    sv598_disablestrictnamechecking : BOOL

    sv598_enableauthenticateusersharing : BOOL

}
