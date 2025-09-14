#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NetManagement {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BASE => 2100

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordExpired => 2242

    /**
     * @type {Integer (UInt32)}
     */
    static CNLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_CNLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DNLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_DNLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static UNCLEN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_UNCLEN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_NNLEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SNLEN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_SNLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static STXTLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_STXTLEN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static PATHLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_PATHLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEVLEN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_DEVLEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVLEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UNLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_UNLEN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static GNLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_GNLEN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PWLEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_PWLEN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SHPWLEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLTYPE_LEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MAXCOMMENTSZ => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_MAXCOMMENTSZ => 48

    /**
     * @type {Integer (UInt32)}
     */
    static QNLEN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_QNLEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ALERTSZ => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NETBIOS_NAME_LEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PREFERRED_LENGTH => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_KEY_LEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_TXT_LEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_PWLEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_PWLEN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_CRYPT_KLEN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PARMNUM_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PARM_ERROR_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PARM_ERROR_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PARMNUM_BASE_INFOLEVEL => 1000

    /**
     * @type {String}
     */
    static MESSAGE_FILENAME => "NETMSG"

    /**
     * @type {String}
     */
    static OS2MSG_FILENAME => "BASE"

    /**
     * @type {String}
     */
    static HELP_MSG_FILENAME => "NETH"

    /**
     * @type {String}
     */
    static BACKUP_MSG_FILENAME => "BAK.MSG"

    /**
     * @type {Integer (UInt32)}
     */
    static PLATFORM_ID_DOS => 300

    /**
     * @type {Integer (UInt32)}
     */
    static PLATFORM_ID_OS2 => 400

    /**
     * @type {Integer (UInt32)}
     */
    static PLATFORM_ID_NT => 500

    /**
     * @type {Integer (UInt32)}
     */
    static PLATFORM_ID_OSF => 600

    /**
     * @type {Integer (UInt32)}
     */
    static PLATFORM_ID_VMS => 700

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_LANMAN_MESSAGE_ID => 2100

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_LANMAN_MESSAGE_ID => 5899

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_Success => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NetNotStarted => 2102

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnknownServer => 2103

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ShareMem => 2104

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoNetworkResource => 2105

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RemoteOnly => 2106

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DevNotRedirected => 2107

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServerNotStarted => 2114

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ItemNotFound => 2115

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnknownDevDir => 2116

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RedirectedPath => 2117

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DuplicateShare => 2118

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoRoom => 2119

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyItems => 2121

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidMaxUsers => 2122

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BufTooSmall => 2123

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RemoteErr => 2127

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LanmanIniError => 2131

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NetworkError => 2136

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_WkstaInconsistentState => 2137

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_WkstaNotStarted => 2138

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BrowserNotStarted => 2139

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InternalError => 2140

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadTransactConfig => 2141

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidAPI => 2142

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadEventName => 2143

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DupNameReboot => 2144

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CfgCompNotFound => 2146

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CfgParamNotFound => 2147

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LineTooLong => 2149

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_QNotFound => 2150

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_JobNotFound => 2151

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestNotFound => 2152

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestExists => 2153

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_QExists => 2154

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_QNoRoom => 2155

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_JobNoRoom => 2156

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestNoRoom => 2157

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestIdle => 2158

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestInvalidOp => 2159

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProcNoRespond => 2160

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SpoolerNotLoaded => 2161

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DestInvalidState => 2162

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_QInvalidState => 2163

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_JobInvalidState => 2164

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SpoolNoMemory => 2165

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DriverNotFound => 2166

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DataTypeInvalid => 2167

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProcNotFound => 2168

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceTableLocked => 2180

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceTableFull => 2181

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceInstalled => 2182

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceEntryLocked => 2183

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceNotInstalled => 2184

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadServiceName => 2185

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceCtlTimeout => 2186

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceCtlBusy => 2187

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadServiceProgName => 2188

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceNotCtrl => 2189

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceKillProc => 2190

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceCtlNotValid => 2191

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotInDispatchTbl => 2192

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadControlRecv => 2193

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ServiceNotStarting => 2194

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AlreadyLoggedOn => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotLoggedOn => 2201

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadUsername => 2202

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadPassword => 2203

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnableToAddName_W => 2204

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnableToAddName_F => 2205

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnableToDelName_W => 2206

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UnableToDelName_F => 2207

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonsPaused => 2209

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonServerConflict => 2210

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonNoUserPath => 2211

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonScriptError => 2212

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_StandaloneLogon => 2214

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonServerNotFound => 2215

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonDomainExists => 2216

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NonValidatedLogon => 2217

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFNotFound => 2219

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_GroupNotFound => 2220

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UserNotFound => 2221

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ResourceNotFound => 2222

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_GroupExists => 2223

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UserExists => 2224

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ResourceExists => 2225

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotPrimary => 2226

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFNotLoaded => 2227

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFNoRoom => 2228

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFFileIOFail => 2229

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFTooManyLists => 2230

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UserLogon => 2231

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ACFNoParent => 2232

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CanNotGrowSegment => 2233

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SpeGroupOp => 2234

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotInCache => 2235

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UserInGroup => 2236

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UserNotInGroup => 2237

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AccountUndefined => 2238

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AccountExpired => 2239

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidWorkstation => 2240

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidLogonHours => 2241

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordCantChange => 2243

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordHistConflict => 2244

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordTooShort => 2245

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordTooRecent => 2246

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidDatabase => 2247

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DatabaseUpToDate => 2248

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SyncRequired => 2249

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UseNotFound => 2250

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadAsgType => 2251

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DeviceIsShared => 2252

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SameAsComputerName => 2253

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoComputerName => 2270

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_MsgAlreadyStarted => 2271

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_MsgInitFailed => 2272

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NameNotFound => 2273

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AlreadyForwarded => 2274

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AddForwarded => 2275

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AlreadyExists => 2276

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyNames => 2277

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DelComputerName => 2278

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LocalForward => 2279

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_GrpMsgProcessor => 2280

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PausedRemote => 2281

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadReceive => 2282

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NameInUse => 2283

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_MsgNotStarted => 2284

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotLocalName => 2285

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoForwardName => 2286

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RemoteFull => 2287

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NameNotForwarded => 2288

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TruncatedBroadcast => 2289

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidDevice => 2294

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_WriteFault => 2295

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DuplicateName => 2297

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DeleteLater => 2298

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_IncompleteDel => 2299

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_MultipleNets => 2300

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NetNameNotFound => 2310

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DeviceNotShared => 2311

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ClientNameNotFound => 2312

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_FileIdNotFound => 2314

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ExecFailure => 2315

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TmpFile => 2316

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooMuchData => 2317

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DeviceShareConflict => 2318

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BrowserTableIncomplete => 2319

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NotLocalDomain => 2320

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_IsDfsShare => 2321

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DevInvalidOpCode => 2331

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DevNotFound => 2332

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DevNotOpen => 2333

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadQueueDevString => 2334

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadQueuePriority => 2335

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoCommDevs => 2337

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_QueueNotFound => 2338

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDevString => 2340

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDev => 2341

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InUseBySpooler => 2342

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CommDevInUse => 2343

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidComputer => 2351

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_MaxLenExceeded => 2354

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadComponent => 2356

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantType => 2357

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyEntries => 2362

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileFileTooBig => 2370

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileOffset => 2371

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileCleanup => 2372

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileUnknownCmd => 2373

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileLoadErr => 2374

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProfileSaveErr => 2375

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogOverflow => 2377

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogFileChanged => 2378

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogFileCorrupt => 2379

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SourceIsDir => 2380

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadSource => 2381

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDest => 2382

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DifferentServers => 2383

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RunSrvPaused => 2385

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ErrCommRunSrv => 2389

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ErrorExecingGhost => 2391

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ShareNotFound => 2392

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidLana => 2400

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_OpenFiles => 2401

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ActiveConns => 2402

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadPasswordCore => 2403

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DevInUse => 2404

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LocalDrive => 2405

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AlertExists => 2430

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyAlerts => 2431

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoSuchAlert => 2432

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadRecipient => 2433

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AcctLimitExceeded => 2434

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidLogSeek => 2440

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadUasConfig => 2450

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidUASOp => 2451

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LastAdmin => 2452

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DCNotFound => 2453

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LogonTrackingError => 2454

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NetlogonNotStarted => 2455

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CanNotGrowUASFile => 2456

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TimeDiffAtDC => 2457

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordMismatch => 2458

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoSuchServer => 2460

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoSuchSession => 2461

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoSuchConnection => 2462

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyServers => 2463

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManySessions => 2464

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyConnections => 2465

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyFiles => 2466

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoAlternateServers => 2467

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TryDownLevel => 2470

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UPSDriverNotStarted => 2480

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UPSInvalidConfig => 2481

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UPSInvalidCommPort => 2482

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UPSSignalAsserted => 2483

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_UPSShutdownFailed => 2484

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDosRetCode => 2500

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProgNeedsExtraMem => 2501

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDosFunction => 2502

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RemoteBootFailed => 2503

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadFileCheckSum => 2504

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoRplBootSystem => 2505

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplLoadrNetBiosErr => 2506

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplLoadrDiskErr => 2507

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ImageParamErr => 2508

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyImageParams => 2509

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NonDosFloppyUsed => 2510

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootRestart => 2511

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplSrvrCallFailed => 2512

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantConnectRplSrvr => 2513

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantOpenImageFile => 2514

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CallingRplSrvr => 2515

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_StartingRplBoot => 2516

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootServiceTerm => 2517

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootStartFailed => 2518

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RPL_CONNECTED => 2519

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BrowserConfiguredToNotRun => 2550

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplNoAdaptersStarted => 2610

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBadRegistry => 2611

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBadDatabase => 2612

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplRplfilesShare => 2613

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplNotRplServer => 2614

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplCannotEnum => 2615

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplWkstaInfoCorrupted => 2616

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplWkstaNotFound => 2617

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplWkstaNameUnavailable => 2618

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplProfileInfoCorrupted => 2619

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplProfileNotFound => 2620

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplProfileNameUnavailable => 2621

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplProfileNotEmpty => 2622

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplConfigInfoCorrupted => 2623

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplConfigNotFound => 2624

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplAdapterInfoCorrupted => 2625

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplInternal => 2626

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplVendorInfoCorrupted => 2627

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootInfoCorrupted => 2628

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplWkstaNeedsUserAcct => 2629

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplNeedsRPLUSERAcct => 2630

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootNotFound => 2631

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplIncompatibleProfile => 2632

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplAdapterNameUnavailable => 2633

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplConfigNotEmpty => 2634

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootInUse => 2635

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBackupDatabase => 2636

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplAdapterNotFound => 2637

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplVendorNotFound => 2638

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplVendorNameUnavailable => 2639

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplBootNameUnavailable => 2640

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_RplConfigNameUnavailable => 2641

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsInternalCorruption => 2660

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsVolumeDataCorrupt => 2661

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsNoSuchVolume => 2662

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsVolumeAlreadyExists => 2663

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsAlreadyShared => 2664

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsNoSuchShare => 2665

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsNotALeafVolume => 2666

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsLeafVolume => 2667

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsVolumeHasMultipleServers => 2668

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsCantCreateJunctionPoint => 2669

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsServerNotDfsAware => 2670

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsBadRenamePath => 2671

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsVolumeIsOffline => 2672

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsNoSuchServer => 2673

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsCyclicalName => 2674

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsNotSupportedInServerDfs => 2675

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsDuplicateService => 2676

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsCantRemoveLastServerShare => 2677

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsVolumeIsInterDfs => 2678

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsInconsistent => 2679

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsServerUpgraded => 2680

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsDataIsIdentical => 2681

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsCantRemoveDfsRoot => 2682

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsChildOrParentInDfs => 2683

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DfsInternalError => 2690

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SetupAlreadyJoined => 2691

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SetupNotJoined => 2692

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SetupDomainController => 2693

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DefaultJoinRequired => 2694

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidWorkgroupName => 2695

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NameUsesIncompatibleCodePage => 2696

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ComputerAccountNotFound => 2697

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PersonalSku => 2698

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_SetupCheckDNSConfig => 2699

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AlreadyCloudDomainJoined => 2700

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordMustChange => 2701

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AccountLockedOut => 2702

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordTooLong => 2703

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordNotComplexEnough => 2704

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PasswordFilterError => 2705

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoOfflineJoinInfo => 2709

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadOfflineJoinInfo => 2710

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantCreateJoinInfo => 2711

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_BadDomainJoinInfo => 2712

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_JoinPerformedMustRestart => 2713

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_NoJoinPending => 2714

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ValuesNotSet => 2715

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantVerifyHostname => 2716

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CantLoadOfflineHive => 2717

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ConnectionInsecure => 2718

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_ProvisioningBlobUnsupported => 2719

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DS8DCRequired => 2720

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_LDAPCapableDCRequired => 2721

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DS8DCNotFound => 2722

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TargetVersionUnsupported => 2723

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_InvalidMachineNameForJoin => 2724

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DS9DCNotFound => 2725

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_PlainTextSecretsRequired => 2726

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CannotUnjoinAadDomain => 2727

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_CannotUpdateAadHostName => 2728

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_DuplicateHostName => 2729

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_HostNameTooLong => 2730

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_TooManyHostNames => 2731

    /**
     * @type {Integer (UInt32)}
     */
    static NERR_AccountReuseBlockedByPolicy => 2732

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NERR => 2999

    /**
     * @type {Integer (UInt32)}
     */
    static UF_TEMP_DUPLICATE_ACCOUNT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static UF_NORMAL_ACCOUNT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static UF_INTERDOMAIN_TRUST_ACCOUNT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static UF_WORKSTATION_TRUST_ACCOUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static UF_SERVER_TRUST_ACCOUNT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static UF_MNS_LOGON_ACCOUNT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static UF_NO_AUTH_DATA_REQUIRED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static UF_PARTIAL_SECRETS_ACCOUNT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static UF_USE_AES_KEYS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static LG_INCLUDE_INDIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_NAME_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PASSWORD_PARMNUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PASSWORD_AGE_PARMNUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PRIV_PARMNUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USER_HOME_DIR_PARMNUM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USER_COMMENT_PARMNUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USER_FLAGS_PARMNUM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USER_SCRIPT_PATH_PARMNUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USER_AUTH_FLAGS_PARMNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USER_FULL_NAME_PARMNUM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USER_USR_COMMENT_PARMNUM => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PARMS_PARMNUM => 13

    /**
     * @type {Integer (UInt32)}
     */
    static USER_WORKSTATIONS_PARMNUM => 14

    /**
     * @type {Integer (UInt32)}
     */
    static USER_LAST_LOGON_PARMNUM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static USER_LAST_LOGOFF_PARMNUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USER_ACCT_EXPIRES_PARMNUM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MAX_STORAGE_PARMNUM => 18

    /**
     * @type {Integer (UInt32)}
     */
    static USER_UNITS_PER_WEEK_PARMNUM => 19

    /**
     * @type {Integer (UInt32)}
     */
    static USER_LOGON_HOURS_PARMNUM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PAD_PW_COUNT_PARMNUM => 21

    /**
     * @type {Integer (UInt32)}
     */
    static USER_NUM_LOGONS_PARMNUM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static USER_LOGON_SERVER_PARMNUM => 23

    /**
     * @type {Integer (UInt32)}
     */
    static USER_COUNTRY_CODE_PARMNUM => 24

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CODE_PAGE_PARMNUM => 25

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PRIMARY_GROUP_PARMNUM => 51

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PROFILE => 52

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PROFILE_PARMNUM => 52

    /**
     * @type {Integer (UInt32)}
     */
    static USER_HOME_DIR_DRIVE_PARMNUM => 53

    /**
     * @type {String}
     */
    static NULL_USERSETINFO_PASSWD => "              "

    /**
     * @type {Integer (UInt32)}
     */
    static UNITS_PER_DAY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PRIV_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PASSWD_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEF_MIN_PWLEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEF_PWUNIQUENESS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEF_MAX_PWHIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEF_MAX_BADPW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VALIDATED_LOGON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PASSWORD_EXPIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NON_VALIDATED_LOGON => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VALID_LOGOFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_MIN_PASSWD_LEN_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_MAX_PASSWD_AGE_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_MIN_PASSWD_AGE_PARMNUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_FORCE_LOGOFF_PARMNUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_PASSWD_HIST_LEN_PARMNUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_ROLE_PARMNUM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_PRIMARY_PARMNUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_DOMAIN_NAME_PARMNUM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_DOMAIN_ID_PARMNUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_LOCKOUT_DURATION_PARMNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MODALS_LOCKOUT_THRESHOLD_PARMNUM => 12

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPIDMASK => 32768

    /**
     * @type {String}
     */
    static GROUP_SPECIALGRP_USERS => "USERS"

    /**
     * @type {String}
     */
    static GROUP_SPECIALGRP_ADMINS => "ADMINS"

    /**
     * @type {String}
     */
    static GROUP_SPECIALGRP_GUESTS => "GUESTS"

    /**
     * @type {String}
     */
    static GROUP_SPECIALGRP_LOCAL => "LOCAL"

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_ALL_PARMNUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_NAME_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_COMMENT_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_ATTRIBUTES_PARMNUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALGROUP_NAME_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALGROUP_COMMENT_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAXPERMENTRIES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_GROUP => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SUCCESS_OPEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SUCCESS_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SUCCESS_DELETE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SUCCESS_ACL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SUCCESS_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_OPEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_WRITE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_DELETE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_ACL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_MASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_FAIL_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_RESOURCE_NAME_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ATTR_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_COUNT_PARMNUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ACCESS_LIST_PARMNUM => 4

    /**
     * @type {String}
     */
    static ACCESS_LETTERS => "RWCXDAP         "

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_PASSWORD_LAST_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_BAD_PASSWORD_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_LOCKOUT_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_BAD_PASSWORD_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_PASSWORD_HISTORY_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NET_VALIDATE_PASSWORD_HISTORY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_REPLICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_SYNCHRONIZE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_PDC_REPLICATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_REDISCOVER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_TC_QUERY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_TRANSPORT_NOTIFY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_FIND_USER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_CHANGE_PASSWORD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_TC_VERIFY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_FORCE_DNS_REG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_QUERY_DNS_REG => 12

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_QUERY_ENC_TYPES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_UNLOAD_NETLOGON_DLL => 65531

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_BACKUP_CHANGE_LOG => 65532

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_TRUNCATE_LOG => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_SET_DBFLAG => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_CONTROL_BREAKPOINT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_REPLICATION_NEEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_REPLICATION_IN_PROGRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_FULL_SYNC_REPLICATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_REDO_NEEDED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_HAS_IP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_HAS_TIMESERV => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_DNS_UPDATE_FAILURE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_VERIFY_STATUS_RETURNED => 128

    /**
     * @type {String}
     */
    static SERVICE_ACCOUNT_PASSWORD => "_SA_{262E99C9-6160-4871-ACEC-4E61736B6F21}"

    /**
     * @type {String}
     */
    static SERVICE_ACCOUNT_SECRET_PREFIX => "_SC_{262E99C9-6160-4871-ACEC-4E61736B6F21}_"

    /**
     * @type {String}
     */
    static ServiceAccountPasswordGUID => "{262e99c9-6160-4871-acec-4e61736b6f21}"

    /**
     * @type {Integer (Int32)}
     */
    static SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SERVICE_ACCOUNT_FLAG_ADD_AGAINST_RODC => 2

    /**
     * @type {Integer (Int32)}
     */
    static SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SERVICE_ACCOUNT_FLAG_REMOVE_OFFLINE => 2

    /**
     * @type {String}
     */
    static ALERTER_MAILSLOT => "\\.\MAILSLOT\Alerter"

    /**
     * @type {String}
     */
    static ALERT_PRINT_EVENT => "PRINTING"

    /**
     * @type {String}
     */
    static ALERT_MESSAGE_EVENT => "MESSAGE"

    /**
     * @type {String}
     */
    static ALERT_ERRORLOG_EVENT => "ERRORLOG"

    /**
     * @type {String}
     */
    static ALERT_ADMIN_EVENT => "ADMIN"

    /**
     * @type {String}
     */
    static ALERT_USER_EVENT => "USER"

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_QSTATUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_DEVSTATUS => 508

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_COMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_INTERV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_DESTOFFLINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_DESTPAUSED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_NOTIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_DESTNOPAPER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_DELETED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_QS_QUEUED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_QS_PAUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_QS_SPOOLING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRJOB_QS_PRINTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_RUN_PERIODICALLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_EXEC_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_RUNS_TODAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_ADD_CURRENT_DATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NONINTERACTIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LOGFLAGS_FORWARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOGFLAGS_BACKWARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOGFLAGS_SEEK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTION_LOCKOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACTION_ADMINUNLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SRVSTATUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SESSLOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SESSLOGOFF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SESSPWERR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AE_CONNSTART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AE_CONNSTOP => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AE_CONNREJ => 6

    /**
     * @type {Integer (UInt32)}
     */
    static AE_RESACCESS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static AE_RESACCESSREJ => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AE_CLOSEFILE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SERVICESTAT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ACLMOD => 12

    /**
     * @type {Integer (UInt32)}
     */
    static AE_UASMOD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NETLOGON => 14

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NETLOGOFF => 15

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NETLOGDENIED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ACCLIMITEXCD => 17

    /**
     * @type {Integer (UInt32)}
     */
    static AE_RESACCESS2 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ACLMODFAIL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LOCKOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static AE_GENERIC_TYPE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SRVSTART => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SRVPAUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SRVCONT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SRVSTOP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AE_GUEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ADMIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_USERLIMIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_GENERAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SESSDIS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_BADPW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_AUTODIS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_UNSHARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ADMINPRIVREQD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ADMINDIS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NOACCESSPERM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ACCRESTRICT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AE_NORMAL_CLOSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_SES_CLOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ADMIN_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_LOGONHOURS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_EXPIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_INVAL_WKSTA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AE_LIM_DELETED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AE_MOD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_ADD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AE_UAS_USER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AE_UAS_GROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AE_UAS_MODALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_SERVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_GOODSESSLOGON => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_BADSESSLOGON => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_GOODNETLOGON => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_BADNETLOGON => 384

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_GOODUSE => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_BADUSE => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_USERLIST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_PERMISSIONS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_RESOURCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SVAUD_LOGONLIM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AA_AUDIT_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_OWNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AA_CLOSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AA_S_OPEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AA_S_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AA_S_CREATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AA_S_DELETE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AA_S_ACL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AA_F_OPEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AA_F_WRITE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AA_F_CREATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AA_F_DELETE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static AA_F_ACL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_OPEN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_WRITE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_CREATE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_DELETE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static AA_A_ACL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ERRLOG_BASE => 3100

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Internal_Error => 3100

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Resource_Shortage => 3101

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Unable_To_Lock_Segment => 3102

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Unable_To_Unlock_Segment => 3103

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Uninstall_Service => 3104

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Init_Exec_Fail => 3105

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Ncb_Error => 3106

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Net_Not_Started => 3107

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Ioctl_Error => 3108

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_System_Semaphore => 3109

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Init_OpenCreate_Err => 3110

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetBios => 3111

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_SMB_Illegal => 3112

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Service_Fail => 3113

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Entries_Lost => 3114

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Init_Seg_Overflow => 3120

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Srv_No_Mem_Grow => 3121

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Access_File_Bad => 3122

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Srvnet_Not_Started => 3123

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Init_Chardev_Err => 3124

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Remote_API => 3125

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Ncb_TooManyErr => 3126

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Mailslot_err => 3127

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReleaseMem_Alert => 3128

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_AT_cannot_write => 3129

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Cant_Make_Msg_File => 3130

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Exec_Netservr_NoMem => 3131

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Server_Lock_Failure => 3132

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Msg_Shutdown => 3140

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Msg_Sem_Shutdown => 3141

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Msg_Log_Err => 3150

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_VIO_POPUP_ERR => 3151

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Msg_Unexpected_SMB_Type => 3152

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_Infoseg => 3160

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_Compname => 3161

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_BiosThreadFailure => 3162

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_IniSeg => 3163

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_HostTab_Full => 3164

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_Bad_Mailslot_SMB => 3165

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_UASInit => 3166

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wksta_SSIRelogon => 3167

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Build_Name => 3170

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Name_Expansion => 3171

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Message_Send => 3172

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Mail_Slt_Err => 3173

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_AT_cannot_read => 3174

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_AT_sched_err => 3175

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_AT_schedule_file_created => 3176

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Srvnet_NB_Open => 3177

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_AT_Exec_Err => 3178

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Lazy_Write_Err => 3180

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_HotFix => 3181

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_HardErr_From_Server => 3182

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_LocalSecFail1 => 3183

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_LocalSecFail2 => 3184

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_LocalSecFail3 => 3185

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_LocalSecGeneralFail => 3186

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_Internal_Error => 3190

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_No_Resource => 3191

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_SMB_Err => 3192

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_VC_Err => 3193

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_Stuck_VC_Err => 3194

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_NCB_Err => 3195

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_Write_Behind_Err => 3196

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_Reset_Err => 3197

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetWkSta_Too_Many => 3198

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Srv_Thread_Failure => 3204

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Srv_Close_Failure => 3205

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplUserCurDir => 3206

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplCannotMasterDir => 3207

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplUpdateError => 3208

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplLostMaster => 3209

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthDCFail => 3210

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplLogonFailed => 3211

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplNetErr => 3212

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplMaxFiles => 3213

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplMaxTreeDepth => 3214

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplBadMsg => 3215

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplSysErr => 3216

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplUserLoged => 3217

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplBadImport => 3218

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplBadExport => 3219

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplSignalFileErr => 3220

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_DiskFT => 3221

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_ReplAccessDenied => 3222

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedPrimary => 3223

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPasswdSetFailed => 3224

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonTrackingError => 3225

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSyncError => 3226

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRequireSignOrSealError => 3227

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_PowerOut => 3230

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_Shutdown => 3231

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_CmdFileError => 3232

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_CannotOpenDriver => 3233

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_PowerBack => 3234

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_CmdFileConfig => 3235

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_UPS_CmdFileExec => 3236

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Missing_Parameter => 3250

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Invalid_Config_Line => 3251

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Invalid_Config_File => 3252

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_File_Changed => 3253

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Files_Dont_Fit => 3254

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Wrong_DLL_Version => 3255

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Error_in_DLL => 3256

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_System_Error => 3257

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_FT_ErrLog_Too_Large => 3258

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_FT_Update_In_Progress => 3259

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Joined_Domain => 3260

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_Joined_Workgroup => 3261

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_OEM_Code => 3299

    /**
     * @type {Integer (UInt32)}
     */
    static ERRLOG2_BASE => 5700

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSSIInitError => 5700

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToUpdateTrustList => 5701

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToAddRpcInterface => 5702

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToReadMailslot => 5703

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToRegisterSC => 5704

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonChangeLogCorrupt => 5705

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToCreateShare => 5706

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDownLevelLogonFailed => 5707

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDownLevelLogoffFailed => 5708

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNTLogonFailed => 5709

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNTLogoffFailed => 5710

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPartialSyncCallSuccess => 5711

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPartialSyncCallFailed => 5712

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFullSyncCallSuccess => 5713

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFullSyncCallFailed => 5714

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPartialSyncSuccess => 5715

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPartialSyncFailed => 5716

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFullSyncSuccess => 5717

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFullSyncFailed => 5718

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthNoDomainController => 5719

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthNoTrustLsaSecret => 5720

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthNoTrustSamAccount => 5721

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonServerAuthFailed => 5722

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonServerAuthNoTrustSamAccount => 5723

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_FailedToRegisterSC => 5724

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_FailedToSetServiceStatus => 5725

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_FailedToGetComputerName => 5726

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_DriverNotLoaded => 5727

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NoTranportLoaded => 5728

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedDomainDelta => 5729

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedGlobalGroupDelta => 5730

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedLocalGroupDelta => 5731

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedUserDelta => 5732

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedPolicyDelta => 5733

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedTrustedDomainDelta => 5734

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedAccountDelta => 5735

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedSecretDelta => 5736

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSystemError => 5737

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDuplicateMachineAccounts => 5738

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonTooManyGlobalGroups => 5739

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonBrowserDriver => 5740

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAddNameFailure => 5741

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplMessages => 5742

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplXnsBoot => 5743

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplSystem => 5744

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaTimeout => 5745

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaFileOpen => 5746

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaFileRead => 5747

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaMemory => 5748

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaFileChecksum => 5749

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaFileLineCount => 5750

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaBbcFile => 5751

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaFileSize => 5752

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaInternal => 5753

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaWrongVersion => 5754

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplWkstaNetwork => 5755

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplAdapterResource => 5756

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplFileCopy => 5757

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplFileDelete => 5758

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplFilePerms => 5759

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplCheckConfigs => 5760

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplCreateProfiles => 5761

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplRegistry => 5762

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplReplaceRPLDISK => 5763

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplCheckSecurity => 5764

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplBackupDatabase => 5765

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplInitDatabase => 5766

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplRestoreDatabaseFailure => 5767

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplRestoreDatabaseSuccess => 5768

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplInitRestoredDatabase => 5769

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSessionTypeWrong => 5770

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_RplUpgradeDBTo40 => 5771

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonLanmanBdcsNotAllowed => 5772

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNoDynamicDns => 5773

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDynamicDnsRegisterFailure => 5774

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDynamicDnsDeregisterFailure => 5775

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedFileCreate => 5776

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonGetSubnetToSite => 5777

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNoSiteForClient => 5778

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonBadSiteName => 5779

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonBadSubnetName => 5780

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDynamicDnsServerFailure => 5781

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDynamicDnsFailure => 5782

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRpcCallCancelled => 5783

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDcSiteCovered => 5784

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDcSiteNotCovered => 5785

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonGcSiteCovered => 5786

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonGcSiteNotCovered => 5787

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedSpnUpdate => 5788

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedDnsHostNameUpdate => 5789

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthNoUplevelDomainController => 5790

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonAuthDomainDowngraded => 5791

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNdncSiteCovered => 5792

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNdncSiteNotCovered => 5793

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDcOldSiteCovered => 5794

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDcSiteNotCoveredAuto => 5795

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonGcOldSiteCovered => 5796

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonGcSiteNotCoveredAuto => 5797

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNdncOldSiteCovered => 5798

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNdncSiteNotCoveredAuto => 5799

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSpnMultipleSamAccountNames => 5800

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonSpnCrackNamesFailure => 5801

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNoAddressToSiteMapping => 5802

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonInvalidGenericParameterValue => 5803

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonInvalidDwordParameterValue => 5804

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonServerAuthFailedNoAccount => 5805

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNoDynamicDnsManual => 5806

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonNoSiteForClients => 5807

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDnsDeregAborted => 5808

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRpcPortRequestFailure => 5809

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonPartialSiteMappingForClients => 5810

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRemoteDynamicDnsRegisterFailure => 5811

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRemoteDynamicDnsDeregisterFailure => 5812

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRejectedRemoteDynamicDnsRegister => 5813

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRejectedRemoteDynamicDnsDeregister => 5814

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonRemoteDynamicDnsUpdateRequestFailure => 5815

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonUserValidationReqInitialTimeOut => 5816

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonUserValidationReqRecurringTimeOut => 5817

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonUserValidationReqWaitInitialWarning => 5818

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonUserValidationReqWaitRecurringWarning => 5819

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonFailedToAddAuthzRpcInterface => 5820

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetLogonFailedToInitializeAuthzRm => 5821

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetLogonFailedToInitializeRPCSD => 5822

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonMachinePasswdSetSucceeded => 5823

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonMsaPasswdSetSucceeded => 5824

    /**
     * @type {Integer (UInt32)}
     */
    static NELOG_NetlogonDnsHostNameLowerCasingFailed => 5825

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonNonWindowsSupportsSecureRpc => 5826

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonUnsecureRpcClient => 5827

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonUnsecureRpcTrust => 5828

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonUnsecuredRpcMachineTemporarilyAllowed => 5829

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonUnsecureRpcMachineAllowedBySsdl => 5830

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonUnsecureRpcTrustAllowedBySsdl => 5831

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_PassThruFilterError_Summary_AdminOverride => 5832

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_PassThruFilterError_Summary_Blocked => 5833

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_PassThruFilterError_Request_AdminOverride => 5834

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_PassThruFilterError_Request_Blocked => 5835

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRpcBacklogLimitSet => 5836

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRpcBacklogLimitFailure => 5837

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRpcSigningClient => 5838

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRpcSigningTrust => 5839

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRc4Allowed => 5840

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOG_NetlogonRc4Denied => 5841

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_ACCT_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_DNS_NAME_CHANGES_ONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_INSTALL_INVOCATION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_ALT_SAMACCOUNTNAME => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IGNORE_UNSUPPORTED_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_PERSISTENTSITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_CHECK_PWD_ONLY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISIONING_PARAMS_WIN8_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSGNAME_NOT_FORWARDED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MSGNAME_FORWARDED_TO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSGNAME_FORWARDED_FROM => 16

    /**
     * @type {Integer (Int32)}
     */
    static SUPPORTS_ANY => -1

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PERMISSION_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOCATE_RESPONSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USE_SPECIFIC_TRANSPORT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SV_PLATFORM_ID_OS2 => 400

    /**
     * @type {Integer (UInt32)}
     */
    static SV_PLATFORM_ID_NT => 500

    /**
     * @type {Integer (UInt32)}
     */
    static MAJOR_VERSION_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static SV_NODISC => -1

    /**
     * @type {Integer (UInt32)}
     */
    static SV_PLATFORM_ID_PARMNUM => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NAME_PARMNUM => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SV_VERSION_MAJOR_PARMNUM => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SV_VERSION_MINOR_PARMNUM => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SV_TYPE_PARMNUM => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SV_COMMENT_PARMNUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SV_USERS_PARMNUM => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DISC_PARMNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SV_HIDDEN_PARMNUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ANNOUNCE_PARMNUM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ANNDELTA_PARMNUM => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SV_USERPATH_PARMNUM => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ULIST_MTIME_PARMNUM => 401

    /**
     * @type {Integer (UInt32)}
     */
    static SV_GLIST_MTIME_PARMNUM => 402

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ALIST_MTIME_PARMNUM => 403

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ALERTS_PARMNUM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SECURITY_PARMNUM => 405

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NUMADMIN_PARMNUM => 406

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LANMASK_PARMNUM => 407

    /**
     * @type {Integer (UInt32)}
     */
    static SV_GUESTACC_PARMNUM => 408

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CHDEVQ_PARMNUM => 410

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CHDEVJOBS_PARMNUM => 411

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CONNECTIONS_PARMNUM => 412

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SHARES_PARMNUM => 413

    /**
     * @type {Integer (UInt32)}
     */
    static SV_OPENFILES_PARMNUM => 414

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SESSREQS_PARMNUM => 417

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ACTIVELOCKS_PARMNUM => 419

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NUMREQBUF_PARMNUM => 420

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NUMBIGBUF_PARMNUM => 422

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NUMFILETASKS_PARMNUM => 423

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ALERTSCHED_PARMNUM => 37

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ERRORALERT_PARMNUM => 38

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LOGONALERT_PARMNUM => 39

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ACCESSALERT_PARMNUM => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DISKALERT_PARMNUM => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NETIOALERT_PARMNUM => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXAUDITSZ_PARMNUM => 43

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SRVHEURISTICS_PARMNUM => 431

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SESSOPENS_PARMNUM => 501

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SESSVCS_PARMNUM => 502

    /**
     * @type {Integer (UInt32)}
     */
    static SV_OPENSEARCH_PARMNUM => 503

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SIZREQBUF_PARMNUM => 504

    /**
     * @type {Integer (UInt32)}
     */
    static SV_INITWORKITEMS_PARMNUM => 505

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXWORKITEMS_PARMNUM => 506

    /**
     * @type {Integer (UInt32)}
     */
    static SV_RAWWORKITEMS_PARMNUM => 507

    /**
     * @type {Integer (UInt32)}
     */
    static SV_IRPSTACKSIZE_PARMNUM => 508

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXRAWBUFLEN_PARMNUM => 509

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SESSUSERS_PARMNUM => 510

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SESSCONNS_PARMNUM => 511

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXNONPAGEDMEMORYUSAGE_PARMNUM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXPAGEDMEMORYUSAGE_PARMNUM => 513

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLESOFTCOMPAT_PARMNUM => 514

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEFORCEDLOGOFF_PARMNUM => 515

    /**
     * @type {Integer (UInt32)}
     */
    static SV_TIMESOURCE_PARMNUM => 516

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ACCEPTDOWNLEVELAPIS_PARMNUM => 517

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LMANNOUNCE_PARMNUM => 518

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DOMAIN_PARMNUM => 519

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXCOPYREADLEN_PARMNUM => 520

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXCOPYWRITELEN_PARMNUM => 521

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINKEEPSEARCH_PARMNUM => 522

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXKEEPSEARCH_PARMNUM => 523

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINKEEPCOMPLSEARCH_PARMNUM => 524

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXKEEPCOMPLSEARCH_PARMNUM => 525

    /**
     * @type {Integer (UInt32)}
     */
    static SV_THREADCOUNTADD_PARMNUM => 526

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NUMBLOCKTHREADS_PARMNUM => 527

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SCAVTIMEOUT_PARMNUM => 528

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINRCVQUEUE_PARMNUM => 529

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINFREEWORKITEMS_PARMNUM => 530

    /**
     * @type {Integer (UInt32)}
     */
    static SV_XACTMEMSIZE_PARMNUM => 531

    /**
     * @type {Integer (UInt32)}
     */
    static SV_THREADPRIORITY_PARMNUM => 532

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXMPXCT_PARMNUM => 533

    /**
     * @type {Integer (UInt32)}
     */
    static SV_OPLOCKBREAKWAIT_PARMNUM => 534

    /**
     * @type {Integer (UInt32)}
     */
    static SV_OPLOCKBREAKRESPONSEWAIT_PARMNUM => 535

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEOPLOCKS_PARMNUM => 536

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEOPLOCKFORCECLOSE_PARMNUM => 537

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEFCBOPENS_PARMNUM => 538

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLERAW_PARMNUM => 539

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLESHAREDNETDRIVES_PARMNUM => 540

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINFREECONNECTIONS_PARMNUM => 541

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXFREECONNECTIONS_PARMNUM => 542

    /**
     * @type {Integer (UInt32)}
     */
    static SV_INITSESSTABLE_PARMNUM => 543

    /**
     * @type {Integer (UInt32)}
     */
    static SV_INITCONNTABLE_PARMNUM => 544

    /**
     * @type {Integer (UInt32)}
     */
    static SV_INITFILETABLE_PARMNUM => 545

    /**
     * @type {Integer (UInt32)}
     */
    static SV_INITSEARCHTABLE_PARMNUM => 546

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ALERTSCHEDULE_PARMNUM => 547

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ERRORTHRESHOLD_PARMNUM => 548

    /**
     * @type {Integer (UInt32)}
     */
    static SV_NETWORKERRORTHRESHOLD_PARMNUM => 549

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DISKSPACETHRESHOLD_PARMNUM => 550

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXLINKDELAY_PARMNUM => 552

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINLINKTHROUGHPUT_PARMNUM => 553

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LINKINFOVALIDTIME_PARMNUM => 554

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SCAVQOSINFOUPDATETIME_PARMNUM => 555

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXWORKITEMIDLETIME_PARMNUM => 556

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXRAWWORKITEMS_PARMNUM => 557

    /**
     * @type {Integer (UInt32)}
     */
    static SV_PRODUCTTYPE_PARMNUM => 560

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SERVERSIZE_PARMNUM => 561

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CONNECTIONLESSAUTODISC_PARMNUM => 562

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SHARINGVIOLATIONRETRIES_PARMNUM => 563

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SHARINGVIOLATIONDELAY_PARMNUM => 564

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXGLOBALOPENSEARCH_PARMNUM => 565

    /**
     * @type {Integer (UInt32)}
     */
    static SV_REMOVEDUPLICATESEARCHES_PARMNUM => 566

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LOCKVIOLATIONRETRIES_PARMNUM => 567

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LOCKVIOLATIONOFFSET_PARMNUM => 568

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LOCKVIOLATIONDELAY_PARMNUM => 569

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MDLREADSWITCHOVER_PARMNUM => 570

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CACHEDOPENLIMIT_PARMNUM => 571

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CRITICALTHREADS_PARMNUM => 572

    /**
     * @type {Integer (UInt32)}
     */
    static SV_RESTRICTNULLSESSACCESS_PARMNUM => 573

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEWFW311DIRECTIPX_PARMNUM => 574

    /**
     * @type {Integer (UInt32)}
     */
    static SV_OTHERQUEUEAFFINITY_PARMNUM => 575

    /**
     * @type {Integer (UInt32)}
     */
    static SV_QUEUESAMPLESECS_PARMNUM => 576

    /**
     * @type {Integer (UInt32)}
     */
    static SV_BALANCECOUNT_PARMNUM => 577

    /**
     * @type {Integer (UInt32)}
     */
    static SV_PREFERREDAFFINITY_PARMNUM => 578

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXFREERFCBS_PARMNUM => 579

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXFREEMFCBS_PARMNUM => 580

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXFREELFCBS_PARMNUM => 581

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXFREEPAGEDPOOLCHUNKS_PARMNUM => 582

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINPAGEDPOOLCHUNKSIZE_PARMNUM => 583

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXPAGEDPOOLCHUNKSIZE_PARMNUM => 584

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SENDSFROMPREFERREDPROCESSOR_PARMNUM => 585

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXTHREADSPERQUEUE_PARMNUM => 586

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CACHEDDIRECTORYLIMIT_PARMNUM => 587

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAXCOPYLENGTH_PARMNUM => 588

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLECOMPRESSION_PARMNUM => 590

    /**
     * @type {Integer (UInt32)}
     */
    static SV_AUTOSHAREWKS_PARMNUM => 591

    /**
     * @type {Integer (UInt32)}
     */
    static SV_AUTOSHARESERVER_PARMNUM => 592

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLESECURITYSIGNATURE_PARMNUM => 593

    /**
     * @type {Integer (UInt32)}
     */
    static SV_REQUIRESECURITYSIGNATURE_PARMNUM => 594

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MINCLIENTBUFFERSIZE_PARMNUM => 595

    /**
     * @type {Integer (UInt32)}
     */
    static SV_CONNECTIONNOSESSIONSTIMEOUT_PARMNUM => 596

    /**
     * @type {Integer (UInt32)}
     */
    static SV_IDLETHREADTIMEOUT_PARMNUM => 597

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEW9XSECURITYSIGNATURE_PARMNUM => 598

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENFORCEKERBEROSREAUTHENTICATION_PARMNUM => 599

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DISABLEDOS_PARMNUM => 600

    /**
     * @type {Integer (UInt32)}
     */
    static SV_LOWDISKSPACEMINIMUM_PARMNUM => 601

    /**
     * @type {Integer (UInt32)}
     */
    static SV_DISABLESTRICTNAMECHECKING_PARMNUM => 602

    /**
     * @type {Integer (UInt32)}
     */
    static SV_ENABLEAUTHENTICATEUSERSHARING_PARMNUM => 603

    /**
     * @type {Integer (UInt32)}
     */
    static SVI1_NUM_ELEMENTS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SVI2_NUM_ELEMENTS => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SVI3_NUM_ELEMENTS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAX_CMD_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SW_AUTOPROF_LOAD_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SW_AUTOPROF_SAVE_MASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SV_MAX_SRV_HEUR_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SV_USERS_PER_LICENSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_REMAP_PIPE_NAMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_SCOPED_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_CLUSTER_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_CLUSTER_DNN_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_UNICODE_TRANSPORT_ADDRESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_RESERVED1 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_RESERVED2 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SVTI2_RESERVED3 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SRV_SUPPORT_HASH_GENERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SRV_HASH_GENERATION_ACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INSTALL_STATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UNINSTALLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INSTALL_PENDING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UNINSTALL_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INSTALLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PAUSE_STATE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_SERVICE_ACTIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_SERVICE_CONTINUE_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_SERVICE_PAUSE_PENDING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LM20_SERVICE_PAUSED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOT_UNINSTALLABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UNINSTALLABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOT_PAUSABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PAUSABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_REDIR_PAUSED => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_REDIR_DISK_PAUSED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_REDIR_PRINT_PAUSED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_REDIR_COMM_PAUSED => 1024

    /**
     * @type {String}
     */
    static SERVICE_DOS_ENCRYPTION => "ENCRYPT"

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_INTERROGATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_PAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_CONTINUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_UNINSTALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_REDIR_DISK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_REDIR_PRINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CTRL_REDIR_COMM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_IP_NO_HINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CCP_NO_HINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_IP_QUERY_HINT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CCP_QUERY_HINT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_IP_CHKPT_NUM => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CCP_CHKPT_NUM => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_IP_WAIT_TIME => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CCP_WAIT_TIME => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_IP_WAITTIME_SHIFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NTIP_WAITTIME_SHIFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static UPPER_HINT_MASK => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static LOWER_HINT_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static UPPER_GET_HINT_MASK => 267386880

    /**
     * @type {Integer (UInt32)}
     */
    static LOWER_GET_HINT_MASK => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NT_MAXTIME => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RESRV_MASK => 131071

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_MAXTIME => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_BASE => 3050

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_BADPARMVAL => 3051

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_MISSPARM => 3052

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_UNKPARM => 3053

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_RESOURCE => 3054

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_CONFIG => 3055

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_SYSTEM => 3056

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_INTERNAL => 3057

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_AMBIGPARM => 3058

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_DUPPARM => 3059

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_KILL => 3060

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_EXEC => 3061

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_SUBSERV => 3062

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_CONFLPARM => 3063

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_FILE => 3064

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_MEMORY => 3070

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_DISK => 3071

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_THREADS => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_PROCESSES => 3073

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_SECURITY => 3074

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_LANROOT => 3075

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_REDIR => 3076

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_SERVER => 3077

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_SEC_FILE_ERR => 3078

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_FILES => 3079

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_LOGS => 3080

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_LANGROUP => 3081

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_MSGNAME => 3082

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_ANNOUNCE => 3083

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS => 3084

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_SERVER_SEC_ERR => 3085

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_WKSTA => 3087

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_ERRLOG => 3088

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_FILE_UW => 3089

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_ADDPAK => 3090

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_LAZY => 3091

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS_MACHINE_ACCT => 3092

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS_SERVERS_NMEMB => 3093

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS_SERVERS_NOGRP => 3094

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS_INVALID_ROLE => 3095

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_NETLOGON_NO_DC => 3096

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_NETLOGON_DC_CFLCT => 3097

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_NETLOGON_AUTH => 3098

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_UAS_PROLOG => 3099

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE2_BASE => 5600

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_NETLOGON_MPATH => 5600

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_LSA_MACHINE_ACCT => 5601

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UIC_M_DATABASE_ERROR => 5602

    /**
     * @type {Integer (UInt32)}
     */
    static USE_FLAG_GLOBAL_MAPPING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static USE_LOCAL_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_REMOTE_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USE_PASSWORD_PARMNUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USE_ASGTYPE_PARMNUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USE_USERNAME_PARMNUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USE_DOMAINNAME_PARMNUM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USE_FLAGS_PARMNUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USE_AUTHIDENTITY_PARMNUM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USE_SD_PARMNUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USE_OPTIONS_PARMNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USE_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USE_PAUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_SESSLOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USE_DISCONN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USE_NETERR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USE_CONN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USE_RECONN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USE_CHARDEV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_NO_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_BYPASS_CSC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_CRED_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USE_DEFAULT_CREDENTIALS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REQUIRE_CONNECTION_INTEGRITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REQUIRE_CONNECTION_PRIVACY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_PERSIST_MAPPING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_WRITE_THROUGH_SEMANTICS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_GLOBAL_MAPPING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_PLATFORM_ID_PARMNUM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_COMPUTERNAME_PARMNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LANGROUP_PARMNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_VER_MAJOR_PARMNUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_VER_MINOR_PARMNUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOGGED_ON_USERS_PARMNUM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LANROOT_PARMNUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOGON_DOMAIN_PARMNUM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOGON_SERVER_PARMNUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_CHARWAIT_PARMNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_CHARTIME_PARMNUM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_CHARCOUNT_PARMNUM => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_KEEPCONN_PARMNUM => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_KEEPSEARCH_PARMNUM => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_MAXCMDS_PARMNUM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_NUMWORKBUF_PARMNUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_MAXWRKCACHE_PARMNUM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_SESSTIMEOUT_PARMNUM => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_SIZERROR_PARMNUM => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_NUMALERTS_PARMNUM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_NUMSERVICES_PARMNUM => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_NUMCHARBUF_PARMNUM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_SIZCHARBUF_PARMNUM => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_ERRLOGSZ_PARMNUM => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_PRINTBUFTIME_PARMNUM => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_SIZWORKBUF_PARMNUM => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_MAILSLOTS_PARMNUM => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_NUMDGRAMBUF_PARMNUM => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_WRKHEURISTICS_PARMNUM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_MAXTHREADS_PARMNUM => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOCKQUOTA_PARMNUM => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOCKINCREMENT_PARMNUM => 42

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_LOCKMAXIMUM_PARMNUM => 43

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_PIPEINCREMENT_PARMNUM => 44

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_PIPEMAXIMUM_PARMNUM => 45

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_DORMANTFILELIMIT_PARMNUM => 46

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_CACHEFILETIMEOUT_PARMNUM => 47

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USEOPPORTUNISTICLOCKING_PARMNUM => 48

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USEUNLOCKBEHIND_PARMNUM => 49

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USECLOSEBEHIND_PARMNUM => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_BUFFERNAMEDPIPES_PARMNUM => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USELOCKANDREADANDUNLOCK_PARMNUM => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_UTILIZENTCACHING_PARMNUM => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USERAWREAD_PARMNUM => 54

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USERAWWRITE_PARMNUM => 55

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USEWRITERAWWITHDATA_PARMNUM => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USEENCRYPTION_PARMNUM => 57

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_BUFFILESWITHDENYWRITE_PARMNUM => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_BUFFERREADONLYFILES_PARMNUM => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_FORCECORECREATEMODE_PARMNUM => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_USE512BYTESMAXTRANSFER_PARMNUM => 61

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_READAHEADTHRUPUT_PARMNUM => 62

    /**
     * @type {Integer (UInt32)}
     */
    static WKSTA_OTH_DOMAINS_PARMNUM => 101

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_QUALITYOFSERVICE_PARMNUM => 201

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_NAME_PARMNUM => 202

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_SERVICE_FAILED => -1073739824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_RESOURCE_SHORTAGE => -1073739823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_CREATE_DEVICE => -1073739822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_CREATE_PROCESS => -1073739821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_CREATE_THREAD => -1073739820

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_UNEXPECTED_DISC => -1073739819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_INVALID_REQUEST => -1073739818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_OPEN_NPFS => -1073739817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_GROW_TABLE => -2147481639

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_START_SCAVENGER => -1073739814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_IRP_STACK_SIZE => -1073739813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NETWORK_ERROR => -2147481636

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_DISK_FULL => -2147481635

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_VIRTUAL_MEMORY => -1073739808

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NONPAGED_POOL_LIMIT => -1073739807

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_PAGED_POOL_LIMIT => -1073739806

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_NONPAGED_POOL => -1073739805

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_PAGED_POOL => -1073739804

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_WORK_ITEM => -2147481627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_FREE_CONNECTIONS => -2147481626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_FREE_RAW_WORK_ITEM => -2147481625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_BLOCKING_IO => -2147481624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_DOS_ATTACK_DETECTED => -2147481623

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_TOO_MANY_DOS => -2147481622

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_OUT_OF_WORK_ITEM_DOS => -2147481621

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_KEY_NOT_FOUND => -1073739323

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_KEY_NOT_CREATED => -1073739322

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_NO_TRANSPORTS_BOUND => -1073739321

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_BIND_TO_TRANSPORT => -2147481144

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_BIND_DUP_NAME => -1073739319

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_INVALID_REGISTRY_VALUE => -2147481142

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_INVALID_SD => -2147481141

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_LOAD_DRIVER => -2147481140

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_UNLOAD_DRIVER => -2147481139

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_MAP_ERROR => -2147481138

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_RECREATE_SHARE => -2147481137

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_CANT_CHANGE_DOMAIN_NAME => -2147481136

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SRV_TXF_INIT_FAILED => -2147481135

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_RESOURCE_SHORTAGE => -2147480647

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_CREATE_DEVICE => -2147480646

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_CREATE_THREAD => -2147480645

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_SET_THREAD => -2147480644

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_INVALID_REPLY => -2147480643

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_INVALID_SMB => -2147480642

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_INVALID_LOCK_REPLY => -2147480641

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_FAILED_UNLOCK => -2147480639

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CLOSE_BEHIND => -2147480637

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_UNEXPECTED_ERROR => -2147480636

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_TIMEOUT => -2147480635

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_INVALID_OPLOCK => -2147480634

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CONNECTION_REFERENCE => -2147480633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_SERVER_REFERENCE => -2147480632

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_SMB_REFERENCE => -2147480631

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_ENCRYPT => -2147480630

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CONNECTION => -2147480629

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_MAXCMDS => -2147480627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_OPLOCK_SMB => -2147480626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_DISPOSITION => -2147480625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CONTEXTS => -2147480624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_WRITE_BEHIND_FLUSH_FAILED => -2147480623

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_AT_THREAD_MAX => -2147480622

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_READ_REGISTRY => -2147480621

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_TIMEZONE_BIAS_TOO_LARGE => -2147480620

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_PRIMARY_TRANSPORT_CONNECT_FAILED => -2147480619

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_DELAYED_SET_ATTRIBUTES_FAILED => -2147480618

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_DELETEONCLOSE_FAILED => -2147480617

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_BIND_TRANSPORT => -2147480616

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_REGISTER_ADDRESS => -2147480615

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_GET_SECURITY_CONTEXT => -2147480614

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_CANT_BUILD_SMB_HEADER => -2147480613

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RDR_SECURITY_SIGNATURE_MISMATCH => -2147480612

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP6_STARTED => 1073744924

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STREAMS_STRLOG => -1073737824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STREAMS_ALLOCB_FAILURE => -2147479647

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STREAMS_ALLOCB_FAILURE_CNT => -2147479646

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STREAMS_ESBALLOC_FAILURE => -2147479645

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STREAMS_ESBALLOC_FAILURE_CNT => -2147479644

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_CREATE_DEVICE_FAILED => -1073737724

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_RESOURCES_FOR_INIT => -1073737723

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TOO_MANY_NETS => -1073737639

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_MASK => -1073737638

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_INVALID_ADDRESS => -1073737637

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_INVALID_MASK => -1073737636

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_ADAPTER_RESOURCES => -1073737635

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_DHCP_INIT_FAILED => -2147479458

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_ADAPTER_REG_FAILURE => -1073737633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_INVALID_DEFAULT_GATEWAY => -2147479456

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_ADDRESS_LIST => -1073737631

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_MASK_LIST => -1073737630

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NO_BINDINGS => -1073737629

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_IP_INIT_FAILED => -1073737628

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TOO_MANY_GATEWAYS => -2147479451

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_ADDRESS_CONFLICT1 => -1073737626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_ADDRESS_CONFLICT2 => -1073737625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_NTE_CONTEXT_LIST_FAILURE => -1073737624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_MEDIA_CONNECT => 1073746025

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_MEDIA_DISCONNECT => 1073746026

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_IPV4_UNINSTALLED => 1073746027

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_AUTOCONFIGURED_ADDRESS_LIMIT_REACHED => -2147479444

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_AUTOCONFIGURED_ROUTE_LIMIT_REACHED => -2147479443

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_OUT_OF_ORDER_FRAGMENTS_EXCEEDED => -2147479442

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_INTERFACE_BIND_FAILURE => -1073737617

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_INIT_FAILED => -1073737599

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_CONNECT_LIMIT_REACHED => -2147479422

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_TIME_WAIT_COLLISION => -2147479421

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_WSD_WS_RESTRICTED => -2147479420

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_MPP_ATTACKS_DETECTED => -2147479419

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_CONNECTIONS_PERF_IMPACTED => -2147479418

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_TCP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED => -2147479417

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_UDP_LIMIT_REACHED => -2147479383

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_UDP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED => -2147479382

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_PCF_MULTICAST_OID_ISSUE => -2147479358

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_PCF_MISSING_CAPABILITY => -2147479357

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_PCF_SET_FILTER_FAILURE => -2147479356

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_PCF_NO_ARP_FILTER => -2147479355

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TCPIP_PCF_CLEAR_FILTER_FAILURE => -1073737530

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_CREATE_DRIVER => -1073737524

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_OPEN_REG_PARAMS => -1073737523

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NO_BACKUP_WINS => -2147479346

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NO_WINS => -2147479345

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_BAD_BACKUP_WINS_ADDR => -2147479344

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_BAD_PRIMARY_WINS_ADDR => -2147479343

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NAME_SERVER_ADDRS => -1073737518

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_CREATE_ADDRESS => -1073737517

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_CREATE_CONNECTION => -1073737516

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NON_OS_INIT => -1073737515

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_TIMERS => -1073737514

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_CREATE_DEVICE => -1073737513

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NO_DEVICES => -2147479336

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_OPEN_REG_LINKAGE => -1073737511

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_READ_BIND => -1073737510

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_READ_EXPORT => -1073737509

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_OPEN_REG_NAMESERVER => -2147479332

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SCOPE_LABEL_TOO_LONG => -2147479331

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SCOPE_TOO_LONG => -2147479330

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_DUPLICATE_NAME => -1073737505

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NAME_RELEASE => -1073737504

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_DUPLICATE_NAME_ERROR => -1073737503

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NBT_NO_RESOURCES => -1073737502

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_RESOURCE_CONFLICT => -1073736824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_OUT_OF_RESOURCE => -1073736823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_HARDWARE_FAILURE => -1073736822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_ADAPTER_NOT_FOUND => -1073736821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_INTERRUPT_CONNECT => -1073736820

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_DRIVER_FAILURE => -1073736819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_BAD_VERSION => -1073736818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_TIMEOUT => -2147478641

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_NETWORK_ADDRESS => -1073736816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_UNSUPPORTED_CONFIGURATION => -1073736815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_INVALID_VALUE_FROM_ADAPTER => -1073736814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MISSING_CONFIGURATION_PARAMETER => -1073736813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_BAD_IO_BASE_ADDRESS => -1073736812

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_RECEIVE_SPACE_SMALL => 1073746837

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_ADAPTER_DISABLED => -2147478634

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_IO_PORT_CONFLICT => -2147478633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_PORT_OR_DMA_CONFLICT => -2147478632

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MEMORY_CONFLICT => -2147478631

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_INTERRUPT_CONFLICT => -2147478630

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_DMA_CONFLICT => -2147478629

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_INVALID_DOWNLOAD_FILE_ERROR => -1073736804

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MAXRECEIVES_ERROR => -2147478627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MAXTRANSMITS_ERROR => -2147478626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MAXFRAMESIZE_ERROR => -2147478625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MAXINTERNALBUFS_ERROR => -2147478624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_MAXMULTICAST_ERROR => -2147478623

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_PRODUCTID_ERROR => -2147478622

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_LOBE_FAILUE_ERROR => -2147478621

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_SIGNAL_LOSS_ERROR => -2147478620

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_REMOVE_RECEIVED_ERROR => -2147478619

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_TOKEN_RING_CORRECTION => 1073746854

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_ADAPTER_CHECK_ERROR => -1073736793

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_RESET_FAILURE_ERROR => -2147478616

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_CABLE_DISCONNECTED_ERROR => -2147478615

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NDIS_RESET_FAILURE_CORRECTION => -2147478614

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EventlogStarted => -2147477643

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EventlogStopped => -2147477642

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EventlogAbnormalShutdown => -2147477640

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EventLogProductInfo => -2147477639

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_ComputerNameChange => -2147477637

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSDomainNameChange => -2147477636

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EventlogUptime => -2147477635

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_UP_DRIVER_ON_MP => -1073735724

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_FAILED => -1073734824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_FAILED_II => -1073734823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_FAILED_GROUP => -1073734822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_FAILED_NONE => -1073734821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CALL_TO_FUNCTION_FAILED => -1073734819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CALL_TO_FUNCTION_FAILED_II => -1073734818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_REVERTED_TO_LASTKNOWNGOOD => -1073734817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BAD_ACCOUNT_NAME => -1073734816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CONNECTION_TIMEOUT => -1073734815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_READFILE_TIMEOUT => -1073734814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSACT_TIMEOUT => -1073734813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSACT_INVALID => -1073734812

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FIRST_LOGON_FAILED => -1073734811

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SECOND_LOGON_FAILED => -1073734810

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INVALID_DRIVER_DEPENDENCY => -1073734809

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BAD_SERVICE_STATE => -1073734808

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CIRCULAR_DEPENDENCY_DEMAND => -1073734807

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CIRCULAR_DEPENDENCY_AUTO => -1073734806

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DEPEND_ON_LATER_SERVICE => -1073734805

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DEPEND_ON_LATER_GROUP => -1073734804

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SEVERE_SERVICE_FAILED => -1073734803

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_HUNG => -1073734802

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_EXIT_FAILED => -1073734801

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_EXIT_FAILED_SPECIFIC => -1073734800

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_AT_BOOT_FAILED => -1073734799

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOOT_SYSTEM_DRIVERS_FAILED => -1073734798

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RUNNING_LASTKNOWNGOOD => -1073734797

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TAKE_OWNERSHIP => -1073734796

    /**
     * @type {Integer (Int32)}
     */
    static TITLE_SC_MESSAGE_BOX => -1073734795

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_NOT_INTERACTIVE => -1073734794

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_CRASH => -1073734793

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_RECOVERY_FAILED => -1073734792

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_SCESRV_FAILED => -1073734791

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_CRASH_NO_ACTION => -1073734790

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_CONTROL_SUCCESS => 1073748859

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_STATUS_SUCCESS => 1073748860

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_CONFIG_BACKOUT_FAILED => -1073734787

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FIRST_LOGON_FAILED_II => -1073734786

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_DIFFERENT_PID_CONNECTED => -2147476609

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_START_TYPE_CHANGED => 1073748864

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_LOGON_TYPE_NOT_GRANTED => -1073734783

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_STOP_SUCCESS_WITH_REASON => 1073748866

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SERVICE_SHUTDOWN_FAILED => -1073734781

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_COMMAND_NOT_INTERACTIVE => -1073733924

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_COMMAND_START_FAILED => -1073733923

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_OTHER_MASTER_ON_NET => -1073733821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_PROMOTED_WHILE_ALREADY_MASTER => -2147475644

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_NON_MASTER_MASTER_ANNOUNCE => -2147475643

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_ILLEGAL_DATAGRAM => -2147475642

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_STATUS_BITS_UPDATE_FAILED => -1073733817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_ROLE_CHANGE_FAILED => -1073733816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_MASTER_PROMOTION_FAILED => -1073733815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_NAME_CONVERSION_FAILED => -1073733814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_OTHERDOMAIN_ADD_FAILED => -1073733813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_ELECTION_RECEIVED => 8012

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_ELECTION_SENT_GETBLIST_FAILED => 1073749837

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_ELECTION_SENT_FIND_MASTER_FAILED => 1073749838

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STARTED => 1073749839

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_ILLEGAL_DATAGRAM_THRESHOLD => -1073733808

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_DEPENDANT_SERVICE_FAILED => -1073733807

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_MASTER_PROMOTION_FAILED_STOPPING => -1073733805

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_MASTER_PROMOTION_FAILED_NO_MASTER => -1073733804

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_SERVER_LIST_FAILED => -2147475627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_DOMAIN_LIST_FAILED => -2147475626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_ILLEGAL_CONFIG => -2147475625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_OLD_BACKUP_FOUND => 1073749848

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_SERVER_LIST_RETRIEVED => 8025

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_DOMAIN_LIST_RETRIEVED => 8026

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_PDC_LOST_ELECTION => 1073749851

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_NON_PDC_WON_ELECTION => 1073749852

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_CANT_READ_REGISTRY => 1073749853

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_MAILSLOT_DATAGRAM_THRESHOLD_EXCEEDED => 1073749854

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BOWSER_GETBROWSERLIST_THRESHOLD_EXCEEDED => 1073749855

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_BACKUP_STOPPED => -1073733792

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STOPPED => 1073749857

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_GETBLIST_RECEIVED_NOT_MASTER => -1073733790

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_ELECTION_SENT_ROLE_CHANGED => 1073749859

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BROWSER_NOT_STARTED_IPX_CONFIG_MISMATCH => -1073733788

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_KEY_NOT_FOUND => -1073733324

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WSASTARTUP_FAILED => -1073733323

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_SOCKET_FAILED => -1073733322

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_SETOPTBCAST_FAILED => -1073733321

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_BIND_FAILED => -1073733320

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_GETSOCKNAME_FAILED => -1073733319

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_OPTEXTENDEDADDR_FAILED => -1073733318

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_OPTBCASTINADDR_FAILED => -1073733317

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_CARDMALLOC_FAILED => -1073733316

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_NOCARDS => -1073733315

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_THREADEVENT_FAIL => -1073733314

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_RECVSEM_FAIL => -1073733313

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_SENDEVENT_FAIL => -1073733312

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_STARTRECEIVE_ERROR => -1073733311

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_STARTWORKER_ERROR => -1073733310

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_TABLE_MALLOC_FAILED => -1073733309

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_HASHTABLE_MALLOC_FAILED => -1073733308

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_STARTLPCWORKER_ERROR => -1073733307

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_CREATELPCPORT_ERROR => -1073733306

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_CREATELPCEVENT_ERROR => -1073733305

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_LPCLISTENMEMORY_ERROR => -1073733304

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_LPCHANDLEMEMORY_ERROR => -1073733303

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_BADWANFILTER_VALUE => -1073733302

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_CARDLISTEVENT_FAIL => -1073733301

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_SDMDEVENT_FAIL => -1073733300

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_INVALID_FILTERNAME => -2147475123

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WANSEM_FAIL => -1073733298

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WANSOCKET_FAILED => -1073733297

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WANBIND_FAILED => -1073733296

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_STARTWANWORKER_ERROR => -1073733295

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_STARTWANCHECK_ERROR => -1073733294

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_OPTMAXADAPTERNUM_ERROR => -1073733293

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WANHANDLEMEMORY_ERROR => -1073733292

    /**
     * @type {Integer (Int32)}
     */
    static NWSAP_EVENT_WANEVENT_ERROR => -1073733291

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_RESOURCE_POOL => -2147474647

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_RESOURCE_LIMIT => -2147474646

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_RESOURCE_SPECIFIC => -2147474645

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_REGISTER_FAILED => -1073732820

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_BINDING_FAILED => -1073732819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_ADAPTER_NOT_FOUND => -1073732818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_SET_OID_FAILED => -1073732817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_QUERY_OID_FAILED => -1073732816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_TRANSFER_DATA => 1073750833

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_TOO_MANY_LINKS => 1073750834

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSPORT_BAD_PROTOCOL => 1073750835

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_NEW_DEFAULT_TYPE => 1073751325

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_SAP_ANNOUNCE => -2147474146

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_ILLEGAL_CONFIG => -2147474145

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_INTERNAL_NET_INVALID => -1073732320

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_NO_FRAME_TYPES => -1073732319

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_CREATE_DEVICE => -1073732318

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_IPX_NO_ADAPTERS => -1073732317

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_CREATEPROCESS_FAILURE => -1073731824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_RUNAS_CREATEPROCESS_FAILURE => -1073731823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_LAUNCH_ACCESS_DENIED => -1073731822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_DEFAULT_LAUNCH_ACCESS_DENIED => -1073731821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_RUNAS_CANT_LOGIN => -1073731820

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_START_SERVICE_FAILURE => -1073731819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_REMOTE_SIDE_ERROR => -1073731818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_ACTIVATION_ERROR => -1073731817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_REMOTE_SIDE_ERROR_WITH_FILE => -1073731816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_REMOTE_SIDE_UNAVAILABLE => -1073731815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_SERVER_START_TIMEOUT => -1073731814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_SERVER_NOT_RESPONDING => -1073731813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DCOM_ASSERTION_FAILURE => -1073731812

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DCOM_INVALID_ENDPOINT_DATA => -1073731811

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DCOM_COMPLUS_DISABLED => -1073731810

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_STOP_SERVICE_FAILURE => -1073731795

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_RPCSS_CREATEDEBUGGERPROCESS_FAILURE => -1073731794

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_DLL => -1073730824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_ENTRY => -1073730823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_CONTROL => -1073730822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_DONE_EVENT => -1073730821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_RPC => -1073730820

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_SHUTDOWN_NOTIFY => -1073730819

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_NO_UPDATE => -1073730818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_START_FAILURE_LOW_MEMORY => -1073730817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_NETWORK_PERF_WARNING => -2147472598

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNS_CACHE_UNABLE_TO_REACH_SERVER_WARNING => -2147472597

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT => -2147472498

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL => -2147472497

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP => -2147472496

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED => -2147472495

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY => -2147472494

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_OTHER => -2147472493

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_TIMEOUT => -2147472492

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SERVERFAIL => -2147472491

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_NOTSUPP => -2147472490

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_REFUSED => -2147472489

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SECURITY => -2147472488

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_REGISTRATION_FAILED_OTHER => -2147472487

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT_PRIMARY_DN => -2147472486

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN => -2147472485

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP_PRIMARY_DN => -2147472484

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED_PRIMARY_DN => -2147472483

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY_PRIMARY_DN => -2147472482

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTRATION_FAILED_OTHER_PRIMARY_DN => -2147472481

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT => -2147472468

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL => -2147472467

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP => -2147472466

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED => -2147472465

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY => -2147472464

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER => -2147472463

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_TIMEOUT => -2147472462

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SERVERFAIL => -2147472461

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_NOTSUPP => -2147472460

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_REFUSED => -2147472459

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SECURITY => -2147472458

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_OTHER => -2147472457

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT_PRIMARY_DN => -2147472456

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN => -2147472455

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP_PRIMARY_DN => -2147472454

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED_PRIMARY_DN => -2147472453

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY_PRIMARY_DN => -2147472452

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER_PRIMARY_DN => -2147472451

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTERED_ADAPTER => 1073753024

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTERED_PTR => 1073753025

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DNSAPI_REGISTERED_ADAPTER_PRIMARY_DN => 1073753026

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_INTERNAL_ERROR => -1073729324

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_START_SUCCESS => 1073754325

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_START_FAILURE => -1073729322

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_CORRUPT_LOG => -1073729321

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_VOL_QUOTA_EXCEEDED => -2147471144

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_VOLUME_CREATE => 1073754329

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_VOLUME_CLAIM => 1073754330

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_DUPLICATE_VOLIDS => 1073754331

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRK_SERVICE_MOVE_QUOTA_EXCEEDED => -2147471140

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ERROR => -1073728324

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STARTING => 1073755325

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STOPPING => 1073755326

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STOPPED => 1073755327

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STOPPED_FORCE => -1073728320

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STOPPED_ASSERT => -1073728319

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ASSERT => -1073728318

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_VOLUME_NOT_SUPPORTED => -1073728317

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_LONG_JOIN => -2147470140

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_LONG_JOIN_DONE => -2147470139

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_CANNOT_COMMUNICATE => -1073728314

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_DATABASE_SPACE => -1073728313

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_DISK_WRITE_CACHE_ENABLED => -2147470136

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_JET_1414 => -1073728311

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_SYSVOL_NOT_READY => -2147470134

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_SYSVOL_NOT_READY_PRIMARY => -2147470133

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_SYSVOL_READY => 1073755340

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ACCESS_CHECKS_DISABLED => -2147470131

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ACCESS_CHECKS_FAILED_USER => -2147470130

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ACCESS_CHECKS_FAILED_UNKNOWN => -1073728305

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_MOVED_PREEXISTING => -2147470128

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_CANNOT_START_BACKUP_RESTORE_IN_PROGRESS => -1073728303

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STAGING_AREA_FULL => -2147470126

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_HUGE_FILE => -2147470125

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_CANNOT_CREATE_UUID => -1073728300

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_NO_DNS_ATTRIBUTE => -2147470123

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_NO_SID => -1073728298

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_OPEN_RPC_BINDING_ERROR_SET => -1073728297

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_OPEN_RPC_BINDING_ERROR_CONN => -1073728296

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_OPEN_RPC_CALL_ERROR_SET => -1073728295

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_OPEN_RPC_CALL_ERROR_CONN => -1073728294

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_COLLECT_RPC_BINDING_ERROR_SET => -1073728293

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_COLLECT_RPC_BINDING_ERROR_CONN => -1073728292

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_COLLECT_RPC_CALL_ERROR_SET => -1073728291

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_COLLECT_RPC_CALL_ERROR_CONN => -1073728290

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_VIRTUALALLOC_ERROR_SET => -1073728289

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_VIRTUALALLOC_ERROR_CONN => -1073728288

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_REGISTRY_ERROR_SET => -1073728287

    /**
     * @type {Integer (Int32)}
     */
    static NTFRSPRF_REGISTRY_ERROR_CONN => -1073728286

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ROOT_NOT_VALID => -1073728285

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_STAGE_NOT_VALID => -1073728284

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_OVERLAPS_LOGGING => -1073728283

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_OVERLAPS_WORKING => -1073728282

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_OVERLAPS_STAGE => -1073728281

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_OVERLAPS_ROOT => -1073728280

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_OVERLAPS_OTHER_STAGE => -1073728279

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_PREPARE_ROOT_FAILED => -1073728278

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_BAD_REG_DATA => -2147470101

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_JOIN_FAIL_TIME_SKEW => -1073728276

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_RMTCO_TIME_SKEW => -1073728275

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_CANT_OPEN_STAGE => -1073728274

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_CANT_OPEN_PREINSTALL => -1073728273

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_REPLICA_SET_CREATE_FAIL => -1073728272

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_REPLICA_SET_CREATE_OK => 1073755377

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_REPLICA_SET_CXTIONS => 1073755378

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_IN_ERROR_STATE => -1073728269

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_REPLICA_NO_ROOT_CHANGE => -1073728268

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_DUPLICATE_IN_CXTION_SYSVOL => -1073728267

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_DUPLICATE_IN_CXTION => -1073728266

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ROOT_HAS_MOVED => -1073728265

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_ERROR_REPLICA_SET_DELETED => -2147470088

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_REPLICA_IN_JRNL_WRAP_ERROR => -1073728263

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FRS_DS_POLL_ERROR_SUMMARY => -2147470086

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_GPC_REGISTER_FAILED => -1073727824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_NO_RESOURCES_FOR_INIT => -1073727823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_REGISTER_PROTOCOL_FAILED => -1073727822

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_REGISTER_MINIPORT_FAILED => -1073727821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_BAD_BESTEFFORT_LIMIT => -2147469548

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_QUERY_OID_GEN_MAXIMUM_FRAME_SIZE => -1073727723

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_QUERY_OID_GEN_MAXIMUM_TOTAL_SIZE => -1073727722

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_QUERY_OID_GEN_LINK_SPEED => -1073727721

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_BINDING_FAILED => -1073727720

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_MISSING_ADAPTER_REGISTRY_DATA => -1073727719

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_REGISTER_ADDRESS_FAMILY_FAILED => -1073727718

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_INIT_DEVICE_FAILED => -1073727717

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_WMI_INSTANCE_NAME_FAILED => -1073727716

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_WAN_LIMITED_BESTEFFORT => -2147469539

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_RESOURCE_POOL => -1073727714

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_ADMISSIONCONTROL_OVERFLOW => -2147469537

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PS_NETWORK_ADDRESS_FAIL => -1073727712

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_EXIT_POINT => -1073727524

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_EXIT_POINT => -1073727523

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_VOLUME => -1073727522

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_VOLUME => -1073727521

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_EXIT_POINT_DELETED => -1073727520

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_EXIT_POINT_NOT_DELETED => -1073727519

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_EXIT_POINT_CREATED => -1073727518

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_EXIT_POINT_NOT_CREATED => -1073727517

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_VOLUME_CREATED => -1073727516

    /**
     * @type {Integer (Int32)}
     */
    static MISSING_VOLUME_NOT_CREATED => -1073727515

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_VOLUME_DELETED => -1073727514

    /**
     * @type {Integer (Int32)}
     */
    static EXTRA_VOLUME_NOT_DELETED => -1073727513

    /**
     * @type {Integer (Int32)}
     */
    static COULD_NOT_VERIFY_VOLUMES => -1073727512

    /**
     * @type {Integer (Int32)}
     */
    static KNOWLEDGE_INCONSISTENCY_DETECTED => -1073727511

    /**
     * @type {Integer (Int32)}
     */
    static PREFIX_MISMATCH => -1073727510

    /**
     * @type {Integer (Int32)}
     */
    static PREFIX_MISMATCH_FIXED => -1073727509

    /**
     * @type {Integer (Int32)}
     */
    static PREFIX_MISMATCH_NOT_FIXED => -1073727508

    /**
     * @type {Integer (Int32)}
     */
    static MACHINE_UNJOINED => -1073727507

    /**
     * @type {Integer (Int32)}
     */
    static DFS_REFERRAL_REQUEST => 1073756142

    /**
     * @type {Integer (Int32)}
     */
    static NOT_A_DFS_PATH => 1073756224

    /**
     * @type {Integer (Int32)}
     */
    static LM_REDIR_FAILURE => 1073756225

    /**
     * @type {Integer (Int32)}
     */
    static DFS_CONNECTION_FAILURE => 1073756226

    /**
     * @type {Integer (Int32)}
     */
    static DFS_REFERRAL_FAILURE => 1073756227

    /**
     * @type {Integer (Int32)}
     */
    static DFS_REFERRAL_SUCCESS => 1073756228

    /**
     * @type {Integer (Int32)}
     */
    static DFS_MAX_DNR_ATTEMPTS => 1073756229

    /**
     * @type {Integer (Int32)}
     */
    static DFS_SPECIAL_REFERRAL_FAILURE => 1073756230

    /**
     * @type {Integer (Int32)}
     */
    static DFS_OPEN_FAILURE => 1073756231

    /**
     * @type {Integer (Int32)}
     */
    static NET_DFS_ENUM => 1073756324

    /**
     * @type {Integer (Int32)}
     */
    static NET_DFS_ENUMEX => 1073756325

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_CREATE_REPARSEPOINT_FAILURE => -1073727321

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_UNSUPPORTED_FILESYSTEM => -1073727320

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_OVERLAPPING_DIRECTORIES => -1073727319

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_ACTIVEDIRECTORY_ONLINE => 1073756332

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_TOO_MANY_ERRORS => -1073727315

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_WINSOCKINIT_FAILED => -1073727314

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_SECURITYINIT_FAILED => -1073727313

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_THREADINIT_FAILED => -1073727312

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_SITECACHEINIT_FAILED => -1073727311

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_ROOTSYNCINIT_FAILED => -1073727310

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_CREATEEVENT_FAILED => -1073727309

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_COMPUTERINFO_FAILED => -1073727308

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_CLUSTERINFO_FAILED => -1073727307

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_DCINFO_FAILED => -1073727306

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_PREFIXTABLE_FAILED => -1073727305

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_HANDLENAMESPACE_FAILED => -1073727304

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_REGISTERSTORE_FAILED => -1073727303

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_REFLECTIONENGINE_FAILED => -1073727302

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_ACTIVEDIRECTORY_OFFLINE => -1073727301

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_SITESUPPOR_FAILED => -1073727300

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_DSCONNECT_FAILED => -2147469122

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_DS_RECONNECTED => 1073756353

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_NO_DFS_DATA => -1073727294

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_FINISH_INIT => 1073756355

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_RECONNECT_DATA => 1073756356

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_FINISH_BUILDING_NAMESPACE => 1073756357

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_ON_ROOT => -2147469114

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_MUTLIPLE_ROOTS_NOT_SUPPORTED => -1073727289

    /**
     * @type {Integer (Int32)}
     */
    static DFS_WARN_DOMAIN_REFERRAL_OVERFLOW => -2147469112

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_DOMAIN_REFERRAL_MIN_OVERFLOW => 1073756361

    /**
     * @type {Integer (Int32)}
     */
    static DFS_WARN_INCOMPLETE_MOVE => -2147469110

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_RESYNCHRONIZE_FAILED => -1073727285

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_REMOVE_LINK_FAILED => -1073727284

    /**
     * @type {Integer (Int32)}
     */
    static DFS_WARN_METADATA_LINK_TYPE_INCORRECT => -2147469107

    /**
     * @type {Integer (Int32)}
     */
    static DFS_WARN_METADATA_LINK_INFO_INVALID => -2147469106

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_TARGET_LIST_INCORRECT => -1073727281

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_LINKS_OVERLAP => -1073727280

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_LINK_OVERLAP => -1073727279

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_CREATE_REPARSEPOINT_SUCCESS => 1073756370

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_DUPLICATE_LINK => -1073727277

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_TRUSTED_DOMAIN_INFO_FAILED => -1073727276

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_TRUSTED_DOMAIN_INFO_SUCCESS => 1073756373

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ERROR_CROSS_FOREST_TRUST_INFO_FAILED => -1073727274

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INFO_CROSS_FOREST_TRUST_INFO_SUCCESS => 1073756375

    /**
     * @type {Integer (Int32)}
     */
    static DFS_INIT_SUCCESS => 1073756376

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ROOT_SHARE_ACQUIRE_FAILED => -2147469095

    /**
     * @type {Integer (Int32)}
     */
    static DFS_ROOT_SHARE_ACQUIRE_SUCCESS => 1073756378

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_PROTOCOL_REGISTER_FAILED => -1073727224

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_MINIPROT_DEVNAME_MISSING => -1073727223

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_MINIPORT_REGISTER_FAILED => -1073727222

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_DEVICE_CREATION_FAILED => -1073727221

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_NO_BRIDGE_MAC_ADDR => -1073727220

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_MINIPORT_INIT_FAILED => -1073727219

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ETHERNET_NOT_OFFERED => -1073727218

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_THREAD_CREATION_FAILED => -1073727217

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_THREAD_REF_FAILED => -1073727216

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_PACKET_POOL_CREATION_FAILED => -1073727215

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_BUFFER_POOL_CREATION_FAILED => -1073727214

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_INIT_MALLOC_FAILED => -1073727213

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ADAPTER_LINK_SPEED_QUERY_FAILED => -1073727124

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ADAPTER_MAC_ADDR_QUERY_FAILED => -1073727123

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ADAPTER_FILTER_FAILED => -1073727122

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ADAPTER_NAME_QUERY_FAILED => -1073727121

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_BRIDGE_ADAPTER_BIND_FAILED => -1073727120

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DAV_REDIR_DELAYED_WRITE_FAILED => -2147468848

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WEBCLIENT_CLOSE_PUT_FAILED => -2147468747

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WEBCLIENT_CLOSE_DELETE_FAILED => -2147468746

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WEBCLIENT_CLOSE_PROPPATCH_FAILED => -2147468745

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WEBCLIENT_SETINFO_PROPPATCH_FAILED => -2147468744

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WSK_OWNINGTHREAD_PARAMETER_IGNORED => -1073725824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WINSOCK_TDI_FILTER_DETECTED => -2147467647

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WINSOCK_CLOSESOCKET_STUCK => -2147467646

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_NO_CHANGE => 1073758324

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_WITH_CHANGE => 1073758325

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_USER_POLICY_REFRESH_NO_CHANGE => 1073758326

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_USER_POLICY_REFRESH_WITH_CHANGE => 1073758327

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_TCP_AUTOTUNING_NOT_CONFIGURED => 1073758328

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_TCP_AUTOTUNING_OFF => 1073758329

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_TCP_AUTOTUNING_HIGHLY_RESTRICTED => 1073758330

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_TCP_AUTOTUNING_RESTRICTED => 1073758331

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_TCP_AUTOTUNING_NORMAL => 1073758332

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_APP_MARKING_NOT_CONFIGURED => 1073758333

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_APP_MARKING_IGNORED => 1073758334

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_APP_MARKING_ALLOWED => 1073758335

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_INFO_LOCAL_SETTING_DONT_USE_NLA => 1073758336

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_URL_QOS_APPLICATION_CONFLICT => 1073758337

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_TEST_1 => -2147467048

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_TEST_2 => -2147467047

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_MACHINE_POLICY_VERSION => -2147467046

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_USER_POLICY_VERSION => -2147467045

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_MACHINE_POLICY_PROFILE_NOT_SPECIFIED => -2147467044

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_USER_POLICY_PROFILE_NOT_SPECIFIED => -2147467043

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_MACHINE_POLICY_QUOTA_EXCEEDED => -2147467042

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_USER_POLICY_QUOTA_EXCEEDED => -2147467041

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_MACHINE_POLICY_CONFLICT => -2147467040

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_USER_POLICY_CONFLICT => -2147467039

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_MACHINE_POLICY_NO_FULLPATH_APPNAME => -2147467038

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_WARNING_USER_POLICY_NO_FULLPATH_APPNAME => -2147467037

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_MACHINE_POLICY_REFERESH => -1073725124

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_USER_POLICY_REFERESH => -1073725123

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_ROOT_KEY => -1073725122

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_OPENING_USER_POLICY_ROOT_KEY => -1073725121

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_TOO_LONG => -1073725120

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_TOO_LONG => -1073725119

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_SIZE_ZERO => -1073725118

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_SIZE_ZERO => -1073725117

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_SUBKEY => -1073725116

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_OPENING_USER_POLICY_SUBKEY => -1073725115

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_PROCESSING_MACHINE_POLICY_FIELD => -1073725114

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_PROCESSING_USER_POLICY_FIELD => -1073725113

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_SETTING_TCP_AUTOTUNING => -1073725112

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EQOS_ERROR_SETTING_APP_MARKING => -1073725111

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WINNAT_SESSION_LIMIT_REACHED => -2147466648

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_ADDRESS_LENGTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NETMAN_VARTYPE_ULONG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NETMAN_VARTYPE_HARDWARE_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETMAN_VARTYPE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_ROLE_EXPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_ROLE_IMPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_ROLE_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_INTERVAL_INFOLEVEL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_PULSE_INFOLEVEL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_GUARDTIME_INFOLEVEL => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_RANDOM_INFOLEVEL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_INTEGRITY_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_INTEGRITY_TREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_EXTENT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_EXTENT_TREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_EXPORT_INTEGRITY_INFOLEVEL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_EXPORT_EXTENT_INFOLEVEL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_UNLOCK_NOFORCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_UNLOCK_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_STATE_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_STATE_NO_MASTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_STATE_NO_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPL_STATE_NEVER_REPLICATED => 3

    /**
     * @type {String}
     */
    static SERVICE_WORKSTATION => "LanmanWorkstation"

    /**
     * @type {String}
     */
    static SERVICE_LM20_WORKSTATION => "WORKSTATION"

    /**
     * @type {String}
     */
    static WORKSTATION_DISPLAY_NAME => "Workstation"

    /**
     * @type {String}
     */
    static SERVICE_SERVER => "LanmanServer"

    /**
     * @type {String}
     */
    static SERVICE_LM20_SERVER => "SERVER"

    /**
     * @type {String}
     */
    static SERVER_DISPLAY_NAME => "Server"

    /**
     * @type {String}
     */
    static SERVICE_BROWSER => "BROWSER"

    /**
     * @type {String}
     */
    static SERVICE_LM20_BROWSER => "BROWSER"

    /**
     * @type {String}
     */
    static SERVICE_MESSENGER => "MESSENGER"

    /**
     * @type {String}
     */
    static SERVICE_LM20_MESSENGER => "MESSENGER"

    /**
     * @type {String}
     */
    static SERVICE_NETRUN => "NETRUN"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NETRUN => "NETRUN"

    /**
     * @type {String}
     */
    static SERVICE_SPOOLER => "SPOOLER"

    /**
     * @type {String}
     */
    static SERVICE_LM20_SPOOLER => "SPOOLER"

    /**
     * @type {String}
     */
    static SERVICE_ALERTER => "ALERTER"

    /**
     * @type {String}
     */
    static SERVICE_LM20_ALERTER => "ALERTER"

    /**
     * @type {String}
     */
    static SERVICE_NETLOGON => "NETLOGON"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NETLOGON => "NETLOGON"

    /**
     * @type {String}
     */
    static SERVICE_NETPOPUP => "NETPOPUP"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NETPOPUP => "NETPOPUP"

    /**
     * @type {String}
     */
    static SERVICE_SQLSERVER => "SQLSERVER"

    /**
     * @type {String}
     */
    static SERVICE_LM20_SQLSERVER => "SQLSERVER"

    /**
     * @type {String}
     */
    static SERVICE_REPL => "REPLICATOR"

    /**
     * @type {String}
     */
    static SERVICE_LM20_REPL => "REPLICATOR"

    /**
     * @type {String}
     */
    static SERVICE_RIPL => "REMOTEBOOT"

    /**
     * @type {String}
     */
    static SERVICE_LM20_RIPL => "REMOTEBOOT"

    /**
     * @type {String}
     */
    static SERVICE_TIMESOURCE => "TIMESOURCE"

    /**
     * @type {String}
     */
    static SERVICE_LM20_TIMESOURCE => "TIMESOURCE"

    /**
     * @type {String}
     */
    static SERVICE_AFP => "AFP"

    /**
     * @type {String}
     */
    static SERVICE_LM20_AFP => "AFP"

    /**
     * @type {String}
     */
    static SERVICE_UPS => "UPS"

    /**
     * @type {String}
     */
    static SERVICE_LM20_UPS => "UPS"

    /**
     * @type {String}
     */
    static SERVICE_XACTSRV => "XACTSRV"

    /**
     * @type {String}
     */
    static SERVICE_LM20_XACTSRV => "XACTSRV"

    /**
     * @type {String}
     */
    static SERVICE_TCPIP => "TCPIP"

    /**
     * @type {String}
     */
    static SERVICE_LM20_TCPIP => "TCPIP"

    /**
     * @type {String}
     */
    static SERVICE_NBT => "NBT"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NBT => "NBT"

    /**
     * @type {String}
     */
    static SERVICE_LMHOSTS => "LMHOSTS"

    /**
     * @type {String}
     */
    static SERVICE_LM20_LMHOSTS => "LMHOSTS"

    /**
     * @type {String}
     */
    static SERVICE_TELNET => "Telnet"

    /**
     * @type {String}
     */
    static SERVICE_LM20_TELNET => "Telnet"

    /**
     * @type {String}
     */
    static SERVICE_SCHEDULE => "Schedule"

    /**
     * @type {String}
     */
    static SERVICE_LM20_SCHEDULE => "Schedule"

    /**
     * @type {String}
     */
    static SERVICE_NTLMSSP => "NtLmSsp"

    /**
     * @type {String}
     */
    static SERVICE_DHCP => "DHCP"

    /**
     * @type {String}
     */
    static SERVICE_LM20_DHCP => "DHCP"

    /**
     * @type {String}
     */
    static SERVICE_NWSAP => "NwSapAgent"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NWSAP => "NwSapAgent"

    /**
     * @type {String}
     */
    static NWSAP_DISPLAY_NAME => "NW Sap Agent"

    /**
     * @type {String}
     */
    static SERVICE_NWCS => "NWCWorkstation"

    /**
     * @type {String}
     */
    static SERVICE_DNS_CACHE => "DnsCache"

    /**
     * @type {String}
     */
    static SERVICE_W32TIME => "w32time"

    /**
     * @type {String}
     */
    static SERVCE_LM20_W32TIME => "w32time"

    /**
     * @type {String}
     */
    static SERVICE_KDC => "kdc"

    /**
     * @type {String}
     */
    static SERVICE_LM20_KDC => "kdc"

    /**
     * @type {String}
     */
    static SERVICE_RPCLOCATOR => "RPCLOCATOR"

    /**
     * @type {String}
     */
    static SERVICE_LM20_RPCLOCATOR => "RPCLOCATOR"

    /**
     * @type {String}
     */
    static SERVICE_TRKSVR => "TrkSvr"

    /**
     * @type {String}
     */
    static SERVICE_LM20_TRKSVR => "TrkSvr"

    /**
     * @type {String}
     */
    static SERVICE_TRKWKS => "TrkWks"

    /**
     * @type {String}
     */
    static SERVICE_LM20_TRKWKS => "TrkWks"

    /**
     * @type {String}
     */
    static SERVICE_NTFRS => "NtFrs"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NTFRS => "NtFrs"

    /**
     * @type {String}
     */
    static SERVICE_ISMSERV => "IsmServ"

    /**
     * @type {String}
     */
    static SERVICE_LM20_ISMSERV => "IsmServ"

    /**
     * @type {String}
     */
    static SERVICE_NTDS => "NTDS"

    /**
     * @type {String}
     */
    static SERVICE_LM20_NTDS => "NTDS"

    /**
     * @type {String}
     */
    static SERVICE_ADWS => "ADWS"

    /**
     * @type {String}
     */
    static SERVICE_DSROLE => "DsRoleSvc"

    /**
     * @type {String}
     */
    static SERVICE_LM20_DSROLE => "DsRoleSvc"

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_ALREADY_INITIALIZED => -2147180512

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_NOT_INITIALIZED => -2147180511

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_IN_USE => -2147180510

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_NO_WRITE_LOCK => -2147180508

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_NEED_REBOOT => -2147180507

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_ACTIVE_RAS_CONNECTIONS => -2147180506

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_ADAPTER_NOT_FOUND => -2147180505

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_COMPONENT_REMOVED_PENDING_REBOOT => -2147180504

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_MAX_FILTER_LIMIT => -2147180503

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_VMSWITCH_ACTIVE_OVER_ADAPTER => -2147180502

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_E_DUPLICATE_INSTANCEID => -2147180501

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_S_REBOOT => 303136

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_S_DISABLE_QUERY => 303138

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_S_STILL_REFERENCED => 303139

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_S_CAUSED_SETUP_CHANGE => 303140

    /**
     * @type {Integer (Int32)}
     */
    static NETCFG_S_COMMIT_NOW => 303141

    /**
     * @type {String}
     */
    static NETCFG_CLIENT_CID_MS_MSClient => "ms_msclient"

    /**
     * @type {String}
     */
    static NETCFG_SERVICE_CID_MS_SERVER => "ms_server"

    /**
     * @type {String}
     */
    static NETCFG_SERVICE_CID_MS_NETBIOS => "ms_netbios"

    /**
     * @type {String}
     */
    static NETCFG_SERVICE_CID_MS_PSCHED => "ms_pschedpc"

    /**
     * @type {String}
     */
    static NETCFG_SERVICE_CID_MS_WLBS => "ms_wlbs"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_APPLETALK => "ms_appletalk"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_NETBEUI => "ms_netbeui"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_NETMON => "ms_netmon"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_NWIPX => "ms_nwipx"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_NWSPX => "ms_nwspx"

    /**
     * @type {String}
     */
    static NETCFG_TRANS_CID_MS_TCPIP => "ms_tcpip"

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_NO_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_BAD_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_UNSUPPORTED_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_SSID_NOT_FOUND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_BAD_SSID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_CONNECTION_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_AUTHENTICATION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_ENCRYPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_KEY_PROVIDED_AUTOMATICALLY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_1X_ENABLED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_EAP_METHOD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_BAD_KEY_INDEX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_KEY_INDEX_RANGE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_XML_ERROR_BAD_NETWORK_KEY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_INVALID_AUTH_FOR_CONNECTION_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_INVALID_ENCRYPTION_FOR_AUTHMODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_KEY_REQUIRED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_REQUIRED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_NOT_APPLICABLE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED_KEY_REQUIRED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_1X_NOT_ENABLED_KEY_PROVIDED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_REQUIRED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_NOT_APPLICABLE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_WPA_NOT_SUPPORTED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_CONFIG_ERROR_WPA_ENCRYPTION_NOT_SUPPORTED => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SET_ERROR_DUPLICATE_NETWORK => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SET_ERROR_MEMORY_ALLOCATION => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SET_ERROR_READING_1X_CONFIG => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SET_ERROR_WRITING_1X_CONFIG => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_SET_ERROR_WRITING_WZC_CFG => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_API_ERROR_NOT_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_XML => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_SCHEMA => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_API_ERROR_XML_VALIDATION_FAILED => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WZC_PROFILE_API_ERROR_INTERNAL => 36

    /**
     * @type {Integer (UInt32)}
     */
    static RF_ROUTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RF_ROUTINGV6 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RF_DEMAND_UPDATE_ROUTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RF_ADD_ALL_INTERFACES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RF_MULTICAST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RF_POWER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ROUTER_VERSION => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTING_DOMAIN_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IR_PROMISCUOUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IR_PROMISCUOUS_MULTICAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_MSDP => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_IGMP => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_BGMP => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_VRRP => 112

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_BOOTP => 9999

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IPV6_DHCP => 999

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_DNS_PROXY => 10003

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_DHCP_ALLOCATOR => 10004

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_NAT => 10005

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_DIFFSERV => 10008

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_MGM => 10009

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_ALG => 10010

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_H323 => 10011

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_FTP => 10012

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_IP_DTP => 10013

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_TYPE_UCAST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_TYPE_MCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_TYPE_MS0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_TYPE_MS1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_VENDOR_MS0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_VENDOR_MS1 => 311

    /**
     * @type {Integer (UInt32)}
     */
    static PROTO_VENDOR_MS2 => 16383

    /**
     * @type {Integer (UInt32)}
     */
    static IPX_PROTOCOL_BASE => 131071

    /**
     * @type {Integer (UInt32)}
     */
    static IPX_PROTOCOL_RIP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RIS_INTERFACE_ADDRESS_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RIS_INTERFACE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIS_INTERFACE_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RIS_INTERFACE_MEDIA_PRESENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RIS_INTERFACE_MEDIA_ABSENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_TUNNEL_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_PIM_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_DOWN_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_DISABLED_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_QUERIER_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MRINFO_LEAF_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_REACHED_CORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_OIF_PRUNED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_PRUNED_UPSTREAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_OLD_ROUTER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NOT_FORWARDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_WRONG_IF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_BOUNDARY_REACHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NO_MULTICAST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_IIF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NO_ROUTE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NOT_LAST_HOP => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_PROHIBITED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MFE_NO_SPACE => 13

    /**
     * @type {String}
     */
    static REGISTER_PROTOCOL_ENTRY_POINT_STRING => "RegisterProtocol"

    /**
     * @type {Integer (UInt32)}
     */
    static ALIGN_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ALIGN_SHIFT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RTR_INFO_BLOCK_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_USE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_USE_CONSOLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_NO_SYNCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_NO_STDINFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_USE_MASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_USE_MSEC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_USE_DATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_TRACEID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static RTUTILS_MAX_PROTOCOL_NAME_LEN => 40

    /**
     * @type {Integer (UInt32)}
     */
    static RTUTILS_MAX_PROTOCOL_DLL_LEN => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PROTOCOL_NAME_LEN => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PROTOCOL_DLL_LEN => 48
;@endregion Constants

;@region Methods
    /**
     * The NetUserAdd function adds a user account and assigns a password and privilege level.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the user class.
     * 
     * Server users must use a system in which the server creates a system account for the new user. The creation of this account is controlled by several parameters in the server's LanMan.ini file.
     * 
     * If the newly added user already exists as a system user, the <b>usri1_home_dir</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_1">USER_INFO_1</a> structure is ignored.
     * 
     * When you call the 
     * <b>NetUserAdd</b> function and specify information level 1, the call initializes the additional members in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_2">USER_INFO_2</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_3">USER_INFO_3</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_4">USER_INFO_4</a> structures to their default values. You can change the default values by making subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function. The default values supplied are listed following. (The prefix usriX indicates that the member can begin with multiple prefixes, for example, usri2_ or usri4_.)
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Default Value</th>
     * </tr>
     * <tr>
     * <td>usriX_auth_flags</td>
     * <td>None (0)</td>
     * </tr>
     * <tr>
     * <td>usriX_full_name</td>
     * <td>None (null string)</td>
     * </tr>
     * <tr>
     * <td>usriX_usr_comment</td>
     * <td>None (null string)</td>
     * </tr>
     * <tr>
     * <td>usriX_parms</td>
     * <td>None (null string)</td>
     * </tr>
     * <tr>
     * <td>usriX_workstations</td>
     * <td>All (null string)</td>
     * </tr>
     * <tr>
     * <td>usriX_acct_expires</td>
     * <td>Never (TIMEQ_FOREVER)</td>
     * </tr>
     * <tr>
     * <td>usriX_max_storage</td>
     * <td>Unlimited (USER_MAXSTORAGE_UNLIMITED)</td>
     * </tr>
     * <tr>
     * <td>usriX_logon_hours</td>
     * <td>Logon allowed at any time (each element 0xFF; all bits set to 1)</td>
     * </tr>
     * <tr>
     * <td>usriX_logon_server</td>
     * <td>Any domain controller (\\*)</td>
     * </tr>
     * <tr>
     * <td>usriX_country_code</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>usriX_code_page</td>
     * <td>0</td>
     * </tr>
     * </table>
     *  
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
     * 
     * 
     * 
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first member of the user information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_PasswordTooShort</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuseradd
     * @since windows5.0
     */
    static NetUserAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetUserAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetUserEnum function retrieves information about all user accounts on a server.
     * @remarks
     * The
     * 				<b>NetUserEnum</b> function retrieves information about all user accounts on a specified remote server or the local computer.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function can be used to quickly enumerate user, computer, or global group account information for display in user interfaces .
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call the <b>NetUserEnum</b> function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The <b>NetUserEnum</b> function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function can be used to retrieve the names and SIDs of domains trusted by a Local Security Authority (LSA) policy object.
     * 
     * The 
     * <b>NetUserEnum</b> function does not return all system users. It returns only those users who have been added with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function. There is no guarantee that the list of users will be returned in sorted order.
     * 
     * If you call 
     * the <b>NetUserEnum</b> function and specify information level 1, 2, or 3,  for the <i>level</i> parameter, the password member of each structure retrieved is set to <b>NULL</b> to maintain password security.  
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * The <b>NetUserEnum</b> function does not support a <i>level</i> parameter of 4 and the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_4">USER_INFO_4</a> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> 
     * 		function supports a <i>level</i> parameter of 4 and the <b>USER_INFO_4</b> structure.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Integer} filter A value that specifies the user account types to be included in the enumeration. A value of zero indicates that all normal user, trust data, and machine account data should be included.
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
     * 
     * The buffer for this data is allocated by the system and the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to free the allocated memory when the data returned is no longer needed. Note that you must free the buffer even if the <b>NetUserEnum</b> function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of the returned data. If you specify MAX_PREFERRED_LENGTH, the <b>NetUserEnum</b> function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint. If your application is communicating with a Windows 2000 or later domain controller, you should consider using the 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>. 
     * 
     * 
     * 
     * 
     * <b>LAN Manager:  </b>If the call is to a computer that is running LAN Manager 2.<i>x</i>, the <i>totalentries</i> parameter will always reflect the total number of entries in the database no matter where it is in the resume sequence.
     * @param {Pointer<UInt32>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing user search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter is set to a value not supported. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BufTooSmall</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to contain an entry. No information has been written to the buffer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserenum
     * @since windows5.0
     */
    static NetUserEnum(servername, level, filter, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetUserEnum", "ptr", servername, "uint", level, "uint", filter, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetUserGetInfo function retrieves information about a particular user account on a server.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If the information level specified in the <i>level</i> parameter is set to 24, the <i>servername</i> parameter specified must resolve to the local computer. If the <i>servername</i> resolves to a remote computer or to a domain controller, the <b>NetUserGetInfo</b>  function will fail.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies the name of the user account for which to return information. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network path specified in the <i>servername</i> parameter was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetinfo
     * @since windows5.1.2600
     */
    static NetUserGetInfo(servername, username, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetUserGetInfo", "ptr", servername, "ptr", username, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetUserSetInfo function sets the parameters of a user account.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function.
     * 
     * Only users or applications having administrative privileges can call the 
     * <b>NetUserSetInfo</b> function to change a user's password. When an administrator calls 
     * <b>NetUserSetInfo</b>, the only restriction applied is that the new password length must be consistent with system modals. A user or application that knows a user's current password can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserchangepassword">NetUserChangePassword</a> function to change the password. For more information about calling functions that require administrator privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Members of the Administrators local group can set any modifiable user account elements. All users can set the <b>usri2_country_code</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_2">USER_INFO_2</a> structure (and the <b>usri1024_country_code</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_1024">USER_INFO_1024</a> structure) for their own accounts.
     * 
     * A member of the Account Operator's local group cannot set details for an Administrators class account, give an existing account Administrator privilege, or change the operator privilege of any account. If you attempt to change the privilege level or disable the last account with Administrator privilege in the security database, (the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory), the 
     * <b>NetUserSetInfo</b> function fails and returns NERR_LastAdmin.
     * 
     * To set the following user account control flags, the following <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">privileges</a> and <a href="https://docs.microsoft.com/windows/desktop/AD/control-access-rights">control access rights</a> are required.
     * 
     * <table>
     * <tr>
     * <th>Account control flag</th>
     * <th>Privilege or right required</th>
     * </tr>
     * <tr>
     * <td>UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION</td>
     * <td>SeEnableDelegationPrivilege privilege, which is granted to Administrators by default. </td>
     * </tr>
     * <tr>
     * <td>UF_TRUSTED_FOR_DELEGATION</td>
     * <td>SeEnableDelegationPrivilege.</td>
     * </tr>
     * <tr>
     * <td>UF_PASSWD_NOTREQD</td>
     * <td>"Update password not required" control access right on the Domain object, which is granted to authenticated users by default.</td>
     * </tr>
     * <tr>
     * <td>UF_DONT_EXPIRE_PASSWD</td>
     * <td>"Unexpire password" control access right on the Domain object, which is granted to authenticated users by default.</td>
     * </tr>
     * <tr>
     * <td>UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED</td>
     * <td>"Enable per user reversibly encrypted password" control access right on the Domain object, which is granted to authenticated users by default.</td>
     * </tr>
     * <tr>
     * <td>UF_SERVER_TRUST_ACCOUNT</td>
     * <td>"Add/remove replica in domain" control access right on the Domain object, which is granted to Administrators by default.</td>
     * </tr>
     * </table>
     *  
     * 
     * For a list of privilege constants, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Authorization  Constants</a>.
     * 
     * The correct way to specify the new name for an account is to call 
     * <b>NetUserSetInfo</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_0">USER_INFO_0</a> and to specify the new value using the <b>usri0_name</b> member. If you call 
     * <b>NetUserSetInfo</b> with other information levels and specify a value using a <b>usriX_name</b> member, the value is ignored.
     * 
     * Note that calls to 
     * <b>NetUserSetInfo</b> can change the home directory only for user accounts that the network server creates.
     * 
     * If the 
     * <b>NetUserSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the user information structure that is invalid. (A user information structure begins with USER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix usri*_ indicates that the member can begin with multiple prefixes, for example, usri10_ or usri1003_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>USER_NAME_PARMNUM</td>
     * <td>usri*_name</td>
     * </tr>
     * <tr>
     * <td>USER_PASSWORD_PARMNUM</td>
     * <td>usri*_password</td>
     * </tr>
     * <tr>
     * <td>USER_PASSWORD_AGE_PARMNUM</td>
     * <td>usri*_password_age</td>
     * </tr>
     * <tr>
     * <td>USER_PRIV_PARMNUM</td>
     * <td>usri*_priv</td>
     * </tr>
     * <tr>
     * <td>USER_HOME_DIR_PARMNUM</td>
     * <td>usri*_home_dir</td>
     * </tr>
     * <tr>
     * <td>USER_COMMENT_PARMNUM</td>
     * <td>usri*_comment</td>
     * </tr>
     * <tr>
     * <td>USER_FLAGS_PARMNUM</td>
     * <td>usri*_flags</td>
     * </tr>
     * <tr>
     * <td>USER_SCRIPT_PATH_PARMNUM</td>
     * <td>usri*_script_path</td>
     * </tr>
     * <tr>
     * <td>USER_AUTH_FLAGS_PARMNUM</td>
     * <td>usri*_auth_flags</td>
     * </tr>
     * <tr>
     * <td>USER_FULL_NAME_PARMNUM</td>
     * <td>usri*_full_name</td>
     * </tr>
     * <tr>
     * <td>USER_USR_COMMENT_PARMNUM</td>
     * <td>usri*_usr_comment</td>
     * </tr>
     * <tr>
     * <td>USER_PARMS_PARMNUM</td>
     * <td>usri*_parms</td>
     * </tr>
     * <tr>
     * <td>USER_WORKSTATIONS_PARMNUM</td>
     * <td>usri*_workstations</td>
     * </tr>
     * <tr>
     * <td>USER_LAST_LOGON_PARMNUM</td>
     * <td>usri*_last_logon</td>
     * </tr>
     * <tr>
     * <td>USER_LAST_LOGOFF_PARMNUM</td>
     * <td>usri*_last_logoff</td>
     * </tr>
     * <tr>
     * <td>USER_ACCT_EXPIRES_PARMNUM</td>
     * <td>usri*_acct_expires</td>
     * </tr>
     * <tr>
     * <td>USER_MAX_STORAGE_PARMNUM</td>
     * <td>usri*_max_storage</td>
     * </tr>
     * <tr>
     * <td>USER_UNITS_PER_WEEK_PARMNUM</td>
     * <td>usri*_units_per_week</td>
     * </tr>
     * <tr>
     * <td>USER_LOGON_HOURS_PARMNUM</td>
     * <td>usri*_logon_hours</td>
     * </tr>
     * <tr>
     * <td>USER_PAD_PW_COUNT_PARMNUM</td>
     * <td>usri*_bad_pw_count</td>
     * </tr>
     * <tr>
     * <td>USER_NUM_LOGONS_PARMNUM</td>
     * <td>usri*_num_logons</td>
     * </tr>
     * <tr>
     * <td>USER_LOGON_SERVER_PARMNUM</td>
     * <td>usri*_logon_server</td>
     * </tr>
     * <tr>
     * <td>USER_COUNTRY_CODE_PARMNUM</td>
     * <td>usri*_country_code</td>
     * </tr>
     * <tr>
     * <td>USER_CODE_PAGE_PARMNUM</td>
     * <td>usri*_code_page</td>
     * </tr>
     * <tr>
     * <td>USER_PRIMARY_GROUP_PARMNUM</td>
     * <td>usri*_primary_group_id</td>
     * </tr>
     * <tr>
     * <td>USER_PROFILE_PARMNUM</td>
     * <td>usri*_profile</td>
     * </tr>
     * <tr>
     * <td>USER_HOME_DIR_DRIVE_PARMNUM</td>
     * <td>usri*_home_dir_drive</td>
     * </tr>
     * </table>
     *  
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * The 
     * <b>NetUserSetInfo</b> function does not control how the password parameters are secured when sent over the network to a remote server to change a user password. Any encryption of these parameters is handled by the Remote Procedure Call (RPC) mechanism supported by the network redirector that provides the network transport. Encryption is also controlled  by the security mechanisms supported by the local computer and the security mechanisms supported by remote network server specified in the <i>servername</i>   parameter. For more details on security when the Microsoft network redirector is used and the remote network server is running Microsoft Windows, see the protocol documentation for <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rpce/290c38b1-92fe-4229-91e6-4fc376610c15">MS-RPCE</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-samr/4df07fab-1bbc-452f-8e92-7853a3c7e380">MS-SAMR</a>.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies the name of the user account for which to set information. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err A pointer to a value that receives the index of the first member of the user information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on specified special groups, which are user groups, admin groups, local groups, or guest groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_LastAdmin</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on the last administrative account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BadPassword</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The share name or password is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_PasswordTooShort</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusersetinfo
     * @since windows5.0
     */
    static NetUserSetInfo(servername, username, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetUserSetInfo", "ptr", servername, "ptr", username, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetUserDel function deletes a user account from a server.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function.
     * 
     * An account cannot be deleted while a user or application is accessing a server resource. If the user was added to the system with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, deleting the user also deletes the user's system account.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username Pointer to a constant string that specifies the name of the user account to delete. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserdel
     * @since windows5.0
     */
    static NetUserDel(servername, username) {
        result := DllCall("NETAPI32.dll\NetUserDel", "ptr", servername, "ptr", username, "uint")
        return result
    }

    /**
     * The NetUserGetGroups function retrieves a list of global groups to which a specified user belongs.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function.
     * 
     * To retrieve a list of the local groups to which a user belongs, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetlocalgroups">NetUserGetLocalGroups</a> function. Network groups are separate and distinct from Windows NT system groups.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies the name of the user to search for in each group account. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of returned data. If MAX_PREFERRED_LENGTH is specified, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually retrieved.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been retrieved.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access rights to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network path was not found. This error is returned if the <i>servername</i> parameter could not be found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is incorrect. This error is returned if the <i>servername</i> parameter has leading or trailing blanks or contains an illegal character. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InternalError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user could not be found. This error is returned if the <i>username</i> could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetgroups
     * @since windows5.0
     */
    static NetUserGetGroups(servername, username, level, bufptr, prefmaxlen, entriesread, totalentries) {
        result := DllCall("NETAPI32.dll\NetUserGetGroups", "ptr", servername, "ptr", username, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "uint")
        return result
    }

    /**
     * The NetUserSetGroups function sets global group memberships for a specified user account.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function.
     * 
     * To grant a user membership in one existing global group, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies the name of the user for which to set global group memberships. For more information, see the Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf A pointer to the buffer that specifies the data. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} num_entries The number of entries contained in the array pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter passed was not valid. This error is returned if the <i>num_entries</i> parameter was not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group group name specified by the <b>grui0_name</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_users_info_0">GROUP_USERS_INFO_0</a> structure or <b>grui1_name</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_users_info_1">GROUP_USERS_INFO_1</a> structure pointed to by the <i>buf</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InternalError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusersetgroups
     * @since windows5.0
     */
    static NetUserSetGroups(servername, username, level, buf, num_entries) {
        result := DllCall("NETAPI32.dll\NetUserSetGroups", "ptr", servername, "ptr", username, "uint", level, "ptr", buf, "uint", num_entries, "uint")
        return result
    }

    /**
     * The NetUserGetLocalGroups function retrieves a list of local groups to which a specified user belongs.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Domain object is used to perform the access check for this function. The caller must have  Read Property permission on the Domain object.
     * 
     * To retrieve a list of global groups to which a specified user belongs, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetgroups">NetUserGetGroups</a> function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies the name of the user for which to return local group membership information. If the string is of the form <i>DomainName</i>&#92;<i>UserName</i> the user name is expected to be found on that domain. If the string is of the form <i>UserName</i>, the user name is expected to be found on the server specified by the <i>servername</i> parameter. For more information, see the Remarks section.
     * @param {Integer} level The information level of the data. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return the names of the local groups to which the user belongs. The <i>bufptr</i> parameter points to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_users_info_0">LOCALGROUP_USERS_INFO_0</a> structures.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} flags A bitmask of flags that affect the operation. Currently, only the value defined is <b>LG_INCLUDE_INDIRECT</b>. If this bit is set, the function also returns the names of the local groups in which the user is indirectly a member (that is, the user has membership in a global group that is itself a member of one or more local groups).
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b>.
     * @param {Integer} prefmaxlen The preferred maximum length, in bytes, of the returned data. If <b>MAX_PREFERRED_LENGTH</b> is specified in this parameter, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access rights to the requested information. This error is also returned if the <i>servername</i> parameter has a trailing blank.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter was not specified as 0. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>flags</i> parameter contains a value other than <b>LG_INCLUDE_INDIRECT</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_DCNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller could not be found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user could not be found. This error is returned if the <i>username</i> could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC server is unavailable. This error is returned if the <i>servername</i> parameter could not be found. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusergetlocalgroups
     * @since windows5.0
     */
    static NetUserGetLocalGroups(servername, username, level, flags, bufptr, prefmaxlen, entriesread, totalentries) {
        result := DllCall("NETAPI32.dll\NetUserGetLocalGroups", "ptr", servername, "ptr", username, "uint", level, "uint", flags, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "uint")
        return result
    }

    /**
     * The NetUserModalsGet function retrieves global information for all users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user modal functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdomain">IADsDomain</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Domain object is used to perform the access check for this function.
     * 
     * To retrieve the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">security identifier</a> (SID) of the domain to which the computer belongs, call the 
     * <b>NetUserModalsGet</b> function specifying a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_modals_info_2">USER_MODALS_INFO_2</a> structure and <b>NULL</b> in the <i>servername</i> parameter. If the computer isn't a member of a domain, the function returns a <b>NULL</b> pointer.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
     * 
     * The buffer for this data is allocated by the system and the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to free the allocated memory when the data returned is no longer needed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network path was not found. This error is returned if the <i>servername</i> parameter could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level </i> parameter is not one of the supported values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file name, directory name, or volume label syntax is incorrect. This error is returned if the <i>servername</i> parameter syntax is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRONG_TARGET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target account name is incorrect. This error is returned for a logon failure to a remote <i>servername</i> parameter running on Windows Vista.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusermodalsget
     * @since windows5.0
     */
    static NetUserModalsGet(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetUserModalsGet", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetUserModalsSet function sets global information for all users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management user modal functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdomain">IADsDomain</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Domain object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
     * 
     * If the 
     * <b>NetUserModalsSet</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the information structure that is invalid. (The information structure begins with USER_MODALS_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix usrmod*_ indicates that the member can begin with multiple prefixes, for example, usrmod2_ or usrmod1002_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>MODALS_MIN_PASSWD_LEN_PARMNUM</td>
     * <td>usrmod*_min_passwd_len</td>
     * </tr>
     * <tr>
     * <td>MODALS_MAX_PASSWD_AGE_PARMNUM</td>
     * <td>usrmod*_max_passwd_age</td>
     * </tr>
     * <tr>
     * <td>MODALS_MIN_PASSWD_AGE_PARMNUM</td>
     * <td>usrmod*_min_passwd_age</td>
     * </tr>
     * <tr>
     * <td>MODALS_FORCE_LOGOFF_PARMNUM</td>
     * <td>usrmod*_force_logoff</td>
     * </tr>
     * <tr>
     * <td>MODALS_PASSWD_HIST_LEN_PARMNUM</td>
     * <td>usrmod*_password_hist_len</td>
     * </tr>
     * <tr>
     * <td>MODALS_ROLE_PARMNUM</td>
     * <td>usrmod*_role</td>
     * </tr>
     * <tr>
     * <td>MODALS_PRIMARY_PARMNUM</td>
     * <td>usrmod*_primary</td>
     * </tr>
     * <tr>
     * <td>MODALS_DOMAIN_NAME_PARMNUM</td>
     * <td>usrmod*_domain_name</td>
     * </tr>
     * <tr>
     * <td>MODALS_DOMAIN_ID_PARMNUM</td>
     * <td>usrmod*_domain_id</td>
     * </tr>
     * <tr>
     * <td>MODALS_LOCKOUT_DURATION_PARMNUM</td>
     * <td>usrmod*_lockout_duration</td>
     * </tr>
     * <tr>
     * <td>MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM</td>
     * <td>usrmod*_lockout_observation_window</td>
     * </tr>
     * <tr>
     * <td>MODALS_LOCKOUT_THRESHOLD_PARMNUM</td>
     * <td>usrmod*_lockout_threshold</td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first member of the information structure that causes ERROR_INVALID_PARAMETER. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netusermodalsset
     * @since windows5.0
     */
    static NetUserModalsSet(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetUserModalsSet", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetUserChangePassword function changes a user's password for a specified network server or domain.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same result you can achieve by calling the network management user functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsuser">IADsUser</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If an application calls the <b>NetUserChangePassword</b> function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. A user can change his or her own password. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the User object is used to perform the access check for this function. In addition, the caller must have the "Change password" <a href="https://docs.microsoft.com/windows/desktop/AD/control-access-rights">control access right</a> on the User object. This right is granted to Anonymous Logon and Everyone by default. 
     * 
     * Note that for the function to succeed, the <i>oldpassword</i> parameter must match the password as it currently exists.
     * 
     * In some cases, the process that calls the 
     * <b>NetUserChangePassword</b> function must also have the SE_CHANGE_NOTIFY_NAME privilege enabled; otherwise, 
     * <b>NetUserChangePassword</b> fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ACCESS_DENIED. This privilege is not required for the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a> or for accounts that are members of the administrators group. By default, SE_CHANGE_NOTIFY_NAME is enabled for all users, but some administrators may disable the privilege for everyone. For more information about account privileges, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Authorization Constants</a>.
     * 
     * See 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/forcing-a-user-to-change-the-logon-password">Forcing a User to Change the Logon Password</a> for a code sample that demonstrates how to force a user to change the logon password on the next logon using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * The 
     * <b>NetUserChangePassword</b> function does not control how the <i>oldpassword</i> and <i>newpassword</i> parameters are secured when sent over the network to a remote server. Any encryption of these parameters is handled by the Remote Procedure Call (RPC) mechanism supported by the network redirector that provides the network transport. Encryption is also controlled  by the security mechanisms supported by the local computer and the security mechanisms supported by remote network server or domain specified in the <i>domainname</i>   parameter. For more details on security when the Microsoft network redirector is used and the remote network server is running Microsoft Windows, see the protocol documentation for <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rpce/290c38b1-92fe-4229-91e6-4fc376610c15">MS-RPCE</a>, <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-samr/4df07fab-1bbc-452f-8e92-7853a3c7e380">MS-SAMR</a>, <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-spng/f377a379-c24f-4a0f-a3eb-0d835389e28a">MS-SPNG</a>, and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-nlmp/b38c36ed-2804-4868-a9ff-8dd3182128e4">MS-NLMP</a>.
     * @param {Pointer<PWSTR>} domainname A pointer to a constant string that specifies the DNS or NetBIOS name of a remote server or domain on which the function is to execute. If this parameter is <b>NULL</b>, the logon domain of the caller is used.
     * @param {Pointer<PWSTR>} username A pointer to a constant string that specifies a user name. The 
     * <b>NetUserChangePassword</b> function changes the password for the specified user.
     * 
     * If this parameter is <b>NULL</b>, the logon name of the caller is used. For more information, see the following Remarks section.
     * @param {Pointer<PWSTR>} oldpassword A pointer to a constant string that specifies the user's old password.
     * @param {Pointer<PWSTR>} newpassword A pointer to a constant string that specifies the user's new password.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has entered an invalid password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_PasswordTooShort</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password is shorter than required. (The password could also be too long, be too recent in its change history, not have enough unique characters, or not meet another password policy requirement.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netuserchangepassword
     * @since windows5.0
     */
    static NetUserChangePassword(domainname, username, oldpassword, newpassword) {
        A_LastError := 0

        result := DllCall("NETAPI32.dll\NetUserChangePassword", "ptr", domainname, "ptr", username, "ptr", oldpassword, "ptr", newpassword, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The NetGroupAdd function creates a global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the group class. Typically, callers must also have write access to the entire object for calls to this function to succeed.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first member of the global group information structure in error when ERROR_INVALID_PARAMETER is returned. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupadd
     * @since windows5.0
     */
    static NetGroupAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetGroupAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetGroupAddUser function gives an existing user account membership in an existing global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} GroupName Pointer to a constant string that specifies the name of the global group in which the user is to be given membership. For more information, see the following Remarks section.
     * @param {Pointer<PWSTR>} username Pointer to a constant string that specifies the name of the user to be given membership in the global group. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupadduser
     * @since windows5.0
     */
    static NetGroupAddUser(servername, GroupName, username) {
        result := DllCall("NETAPI32.dll\NetGroupAddUser", "ptr", servername, "ptr", GroupName, "ptr", username, "uint")
        return result
    }

    /**
     * The NetGroupEnum function retrieves information about each global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
     * 
     * To determine the exact total number of groups, you must enumerate the entire tree, which can be a costly operation. To enumerate the entire tree, use the <i>resume_handle</i> parameter to continue the enumeration for consecutive calls, and use the <i>entriesread</i> parameter to accumulate the total number of groups. If your application is communicating with a domain controller, you should consider using the 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer to receive the global group information structure. The format of this data depends on the value of the <i>level</i> parameter. 
     * 
     * 
     * 
     * 
     * The system allocates the memory for this buffer. You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required to hold the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. The total number of entries is only a hint. For more information about determining the exact number of entries, see the following Remarks section.
     * @param {Pointer<UIntPtr>} resume_handle Pointer to a variable that contains a resume handle that is used to continue the global group enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupenum
     * @since windows5.0
     */
    static NetGroupEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetGroupEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetGroupGetInfo function retrieves information about a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the global group for which to retrieve information. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the address of the buffer that receives the global group information structure. The format of this data depends on the value of the <i>level</i> parameter. The system allocates the memory for this buffer. You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupgetinfo
     * @since windows5.0
     */
    static NetGroupGetInfo(servername, groupname, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetGroupGetInfo", "ptr", servername, "ptr", groupname, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetGroupSetInfo function sets the parameters of a global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * 
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
     * 
     * The correct way to set the new name of a global group is to call the 
     * <b>NetGroupSetInfo</b> function, using a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_info_0">GROUP_INFO_0</a> structure. Specify the new value in the <b>grpi0_name</b> member. If you use a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-group_info_1">GROUP_INFO_1</a> structure and specify the value in the <b>grpi1_name</b> member, the new name value is ignored.
     * 
     * If the 
     * <b>NetGroupSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the group information structure that is invalid. (A group information structure begins with GROUP_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix grpi*_ indicates that the member can begin with multiple prefixes, for example, grpi1_ or grpi2_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>GROUP_NAME_PARMNUM</td>
     * <td>grpi*_name</td>
     * </tr>
     * <tr>
     * <td>GROUP_COMMENT_PARMNUM</td>
     * <td>grpi*_comment</td>
     * </tr>
     * <tr>
     * <td>GROUP_ATTRIBUTES_PARMNUM</td>
     * <td>grpi*_attributes</td>
     * </tr>
     * </table>
     *  
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the global group for which to set information. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first member of the group information structure in error following an ERROR_INVALID_PARAMETER error code. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupsetinfo
     * @since windows5.0
     */
    static NetGroupSetInfo(servername, groupname, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetGroupSetInfo", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetGroupDel function deletes a global group from the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the global group account to delete. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupdel
     * @since windows5.0
     */
    static NetGroupDel(servername, groupname) {
        result := DllCall("NETAPI32.dll\NetGroupDel", "ptr", servername, "ptr", groupname, "uint")
        return result
    }

    /**
     * The NetGroupDelUser function removes a user from a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} GroupName Pointer to a constant string that specifies the name of the global group from which the user's membership should be removed. For more information, see the following Remarks section.
     * @param {Pointer<PWSTR>} Username Pointer to a constant string that specifies the name of the user to remove from the global group. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotInGroup</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not belong to this global group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupdeluser
     * @since windows5.0
     */
    static NetGroupDelUser(servername, GroupName, Username) {
        result := DllCall("NETAPI32.dll\NetGroupDelUser", "ptr", servername, "ptr", GroupName, "ptr", Username, "uint")
        return result
    }

    /**
     * The NetGroupGetUsers function retrieves a list of the members in a particular global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * To grant one user membership in an existing global group, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function. To remove a user from a global group, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupdeluser">NetGroupDelUser</a> function. For information about replacing the membership of a global group, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetusers">NetGroupSetUsers</a>.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname A pointer to a constant string that specifies the name of the global group whose members are to be listed. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the address of the buffer that receives the information structure. The system allocates the memory for this buffer. You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function to deallocate the memory. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen The preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required to hold the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position.
     * @param {Pointer<UIntPtr>} ResumeHandle A pointer to a variable that contains a resume handle that is used to continue an existing user enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>ResumeHandle</i> parameter is <b>NULL</b>, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name in the structure pointed to by <i>bufptr</i> parameter could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InternalError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupgetusers
     * @since windows5.0
     */
    static NetGroupGetUsers(servername, groupname, level, bufptr, prefmaxlen, entriesread, totalentries, ResumeHandle) {
        result := DllCall("NETAPI32.dll\NetGroupGetUsers", "ptr", servername, "ptr", groupname, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", ResumeHandle, "uint")
        return result
    }

    /**
     * The NetGroupSetUsers function sets the membership for the specified global group.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Group object is used to perform the access check for this function.
     * 
     * You can replace the global group membership with an entirely new list of members by calling the 
     * <b>NetGroupSetUsers</b> function. The typical sequence of steps to perform this follows.
     * 
     * <p class="proch"><b>To replace the global group membership</b>
     * 
     * <ol>
     * <li>Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupgetusers">NetGroupGetUsers</a> function to retrieve the current membership list.</li>
     * <li>Modify the returned membership list to reflect the new membership.</li>
     * <li>Call the 
     * <b>NetGroupSetUsers</b> function to replace the old membership list with the new membership list.</li>
     * </ol>
     * To grant one user membership in an existing global group, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupadduser">NetGroupAddUser</a> function. To remove a user from a global group, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupdeluser">NetGroupDelUser</a> function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname A pointer to a constant string that specifies the name of the global group of interest. For more information, see the Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf A pointer to the buffer that contains the data. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} totalentries The number of entries in the buffer pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system call level is not correct. This error is returned if the <i>level</i> parameter was specified as a value other than 0 or 1. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter passed was not valid. This error is returned if the <i>totalentries</i> parameter was not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The global group name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InternalError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SpeGroupOp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed on certain special groups. These groups include user groups, admin groups, local groups, and guest groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgroupsetusers
     * @since windows5.0
     */
    static NetGroupSetUsers(servername, groupname, level, buf, totalentries) {
        result := DllCall("NETAPI32.dll\NetGroupSetUsers", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "uint", totalentries, "uint")
        return result
    }

    /**
     * The NetLocalGroupAdd function creates a local group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the user container is used to perform the access check for this function. The caller must be able to create child objects of the group class.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If the 
     * <b>NetLocalGroupAdd</b> function returns <b>ERROR_INVALID_PARAMETER</b> and a <b>NULL</b> pointer was not passed in <i>parm_err</i> parameter, on return the <i>parm_err</i> parameter indicates the first member of the local group information structure that is invalid. The format of the local group information structure is specified in the <i>level</i> parameter. A pointer to the local group information structure is passed in <i>buf</i> parameter. The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>LOCALGROUP_NAME_PARMNUM</td>
     * <td>
     * If the <i>level</i> parameter was 0, the <b>lgrpi0_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_0">LOCALGROUP_INFO_0</a> 
     * 		 structure was invalid.
     * 
     * If the <i>level</i> parameter was 1, the <b>lgrpi1_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> 
     * 		 structure was invalid.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>LOCALGROUP_COMMENT_PARMNUM</td>
     * <td>
     * If the <i>level</i> parameter was 1, the <b>lgrpi1_comment</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> 
     * 		 structure was invalid.  
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When making requests to a domain controller and Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same results as the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf A pointer to a buffer that contains the local group information structure. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err A pointer to a value that receives the index of the first member of the local group information structure to cause the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the Remarks section in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo">NetLocalGroupSetInfo</a> topic.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALIAS_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local group already exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as an alias.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <i>level</i> parameter is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if one or more of the members in the structure pointed to by the <i>buf</i> parameter is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group name exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as a group name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name exists. This error is returned if the group name member in the structure pointed to by the <i>buf</i> parameter is already in use as a user name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupadd
     * @since windows5.0
     */
    static NetLocalGroupAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetLocalGroupAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetLocalGroupAddMember function is obsolete. You should use the NetLocalGroupAddMembers function instead.
     * @param {Pointer<PWSTR>} servername TBD
     * @param {Pointer<PWSTR>} groupname TBD
     * @param {Pointer<PSID>} membersid TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupaddmember
     */
    static NetLocalGroupAddMember(servername, groupname, membersid) {
        result := DllCall("NETAPI32.dll\NetLocalGroupAddMember", "ptr", servername, "ptr", groupname, "ptr", membersid, "uint")
        return result
    }

    /**
     * The NetLocalGroupEnum function returns information about each local group account on the specified server.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container. 
     * 
     * To determine the exact total number of local groups, you must enumerate the entire tree, which can be a costly operation. To enumerate the entire tree, use the <i>resumehandle</i> parameter to continue the enumeration for consecutive calls, and use the <i>entriesread</i> parameter to accumulate the total number of local groups. If your application is communicating with a domain controller, you should consider using the 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a> to retrieve this type of data more efficiently. The ADSI LDAP Provider implements a set of ADSI objects that support various ADSI interfaces. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI Service Providers</a>.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the address of the buffer that receives the information structure. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the approximate total number of entries that could have been enumerated from the current resume position. The total number of entries is only a hint. For more information about determining the exact number of entries, see the following Remarks section.
     * @param {Pointer<UIntPtr>} resumehandle Pointer to a value that contains a resume handle that is used to continue an existing local group search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BufTooSmall</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The return buffer is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupenum
     * @since windows5.0
     */
    static NetLocalGroupEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
        result := DllCall("NETAPI32.dll\NetLocalGroupEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resumehandle, "uint")
        return result
    }

    /**
     * The NetLocalGroupGetInfo function retrieves information about a particular local group account on a server.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group account for which the information will be retrieved. For more information, see the following Remarks section.
     * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return the comment associated with the local group. The <i>bufptr</i> parameter points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} bufptr Pointer to the address of the buffer that receives the return information structure. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local group does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupgetinfo
     * @since windows5.0
     */
    static NetLocalGroupGetInfo(servername, groupname, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetLocalGroupGetInfo", "ptr", servername, "ptr", groupname, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetLocalGroupSetInfo function changes the name of an existing local group. The function also associates a comment with a local group.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function. Typically, callers must have write access to the entire object for calls to this function to succeed.
     * 
     * To specify the new name of an existing local group, call 
     * <b>NetLocalGroupSetInfo</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_0">LOCALGROUP_INFO_0</a> and specify a value using the <b>lgrpi0_name</b> member. If you call the 
     * <b>NetLocalGroupSetInfo</b> function with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-localgroup_info_1">LOCALGROUP_INFO_1</a> and specify a new value using the <b>lgrpi1_name</b> member, that value will be ignored.
     * 
     * If the 
     * <b>NetLocalGroupSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the local group information structure that is invalid. (A local group information structure begins with LOCALGROUP_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix lgrpi*_ indicates that the member can begin with multiple prefixes, for example, lgrpi0_ or lgrpi1_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>LOCALGROUP_NAME_PARMNUM</td>
     * <td>lgrpi*_name</td>
     * </tr>
     * <tr>
     * <td>LOCALGROUP_COMMENT_PARMNUM</td>
     * <td>lgrpi*_comment</td>
     * </tr>
     * </table>
     *  
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group account to modify. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that contains the local group information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first member of the local group information structure that caused the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local group does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo
     * @since windows5.0
     */
    static NetLocalGroupSetInfo(servername, groupname, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetLocalGroupSetInfo", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetLocalGroupDel function deletes a local group account and all its members from the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group account to delete. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotPrimary</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is allowed only on the primary domain controller of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local group specified by the <i>groupname</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local group does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdel
     * @since windows5.0
     */
    static NetLocalGroupDel(servername, groupname) {
        result := DllCall("NETAPI32.dll\NetLocalGroupDel", "ptr", servername, "ptr", groupname, "uint")
        return result
    }

    /**
     * The NetLocalGroupDelMember function is obsolete. You should use the NetLocalGroupDelMembers function instead.
     * @param {Pointer<PWSTR>} servername TBD
     * @param {Pointer<PWSTR>} groupname TBD
     * @param {Pointer<PSID>} membersid TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdelmember
     */
    static NetLocalGroupDelMember(servername, groupname, membersid) {
        result := DllCall("NETAPI32.dll\NetLocalGroupDelMember", "ptr", servername, "ptr", groupname, "ptr", membersid, "uint")
        return result
    }

    /**
     * The NetLocalGroupGetMembers function retrieves a list of the members of a particular local group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function. 
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * 
     * If this function returns <b>ERROR_MORE_DATA</b>, then it must be repeatedly called until <b>ERROR_SUCCESS</b> or <b>NERR_success</b> is returned.  Failure to do so can result in an RPC connection leak.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} localgroupname Pointer to a constant string that specifies the name of the local group whose members are to be listed. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the address that receives the return information structure. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position.
     * @param {Pointer<UIntPtr>} resumehandle Pointer to a value that contains a resume handle which is used to continue an existing group member search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_ALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local group does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupgetmembers
     * @since windows5.0
     */
    static NetLocalGroupGetMembers(servername, localgroupname, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
        result := DllCall("NETAPI32.dll\NetLocalGroupGetMembers", "ptr", servername, "ptr", localgroupname, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resumehandle, "uint")
        return result
    }

    /**
     * The NetLocalGroupSetMembers function sets the membership for the specified local group.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function.
     * 
     * You can replace the local group membership with an entirely new list of members by calling the 
     * <b>NetLocalGroupSetMembers</b> function. The typical sequence of steps to perform this follows.
     * 
     * <p class="proch"><b>To replace the local group membership</b>
     * 
     * <ol>
     * <li>Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupgetmembers">NetLocalGroupGetMembers</a> function to retrieve the current membership list.</li>
     * <li>Modify the returned membership list to reflect the new membership.</li>
     * <li>Call the 
     * <b>NetLocalGroupSetMembers</b> function to replace the old membership list with the new membership list.</li>
     * </ol>
     * To add one or more existing user accounts or global group accounts to an existing local group, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupaddmembers">NetLocalGroupAddMembers</a> function. To remove one or more members from an existing local group, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupdelmembers">NetLocalGroupDelMembers</a> function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group in which the specified users or global groups should be granted membership. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to the buffer that contains the member information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} totalentries Specifies a value that contains the total number of entries in the buffer pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group specified by the <i>groupname</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members doesn't exist. The local group membership was not changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members cannot be added because it has an invalid account type. The local group membership was not changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupsetmembers
     * @since windows5.0
     */
    static NetLocalGroupSetMembers(servername, groupname, level, buf, totalentries) {
        result := DllCall("NETAPI32.dll\NetLocalGroupSetMembers", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "uint", totalentries, "uint")
        return result
    }

    /**
     * The NetLocalGroupAddMembers function adds membership of one or more existing user accounts or global group accounts to an existing local group.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group to which the specified users or global groups will be added. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that contains the data for the new local group members. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} totalentries Specifies the number of entries in the buffer pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local group specified by the <i>groupname</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members specified do not exist. Therefore, no new members were added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MEMBER_IN_ALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members specified were already members of the local group. No new members were added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members cannot be added because their account type is invalid. No new members were added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupaddmembers
     * @since windows5.0
     */
    static NetLocalGroupAddMembers(servername, groupname, level, buf, totalentries) {
        result := DllCall("NETAPI32.dll\NetLocalGroupAddMembers", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "uint", totalentries, "uint")
        return result
    }

    /**
     * The NetLocalGroupDelMembers function removes one or more members from an existing local group. Local group members can be users or global groups.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Power Users can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the LocalGroup object is used to perform the access check for this function.
     * 
     * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management local group functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsgroup">IADsGroup</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} groupname Pointer to a constant string that specifies the name of the local group from which the specified users or global groups will be removed. For more information, see the following Remarks section.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that specifies the members to be removed. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} totalentries Specifies the number of entries in the array pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_GroupNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local group specified by the <i>groupname</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified members do not exist. No members were deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MEMBER_NOT_IN_ALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the members specified were not members of the local group. No members were deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netlocalgroupdelmembers
     * @since windows5.0
     */
    static NetLocalGroupDelMembers(servername, groupname, level, buf, totalentries) {
        result := DllCall("NETAPI32.dll\NetLocalGroupDelMembers", "ptr", servername, "ptr", groupname, "uint", level, "ptr", buf, "uint", totalentries, "uint")
        return result
    }

    /**
     * The NetQueryDisplayInformation function returns user account, computer, or group account information. Call this function to quickly enumerate account information for display in user interfaces.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The <b>NetQueryDisplayInformation</b> function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container.
     * 
     * The 
     * <b>NetQueryDisplayInformation</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdisplayinformationindex">NetGetDisplayInformationIndex</a> functions provide an efficient mechanism for enumerating user and group accounts. When possible, use these functions instead of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupenum">NetGroupEnum</a> function.
     * 
     * To enumerate trusting domains or member computer accounts, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a>, specifying the appropriate filter value to obtain the account information you require. To enumerate trusted domains, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function.
     * 
     * The number of entries returned by this function depends on the security descriptor located on the root domain object. The API will return  either the first 100 entries or the entire set of entries in the domain, depending on the access privileges of the user. The ACE used to control this behavior is "SAM-Enumerate-Entire-Domain", and is granted to Authenticated Users by default. Administrators can modify this setting to allow users to enumerate the entire domain.
     * 
     * Each call to 
     * <b>NetQueryDisplayInformation</b> returns a maximum of 100 objects. Calling the 
     * <b>NetQueryDisplayInformation</b> function to enumerate domain account information can be costly in terms of performance. If you are programming for Active Directory, you may be able to use methods on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectorysearch">IDirectorySearch</a> interface to make paged queries against the domain. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>. To enumerate trusted domains, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex">LsaEnumerateTrustedDomainsEx</a> function.
     * @param {Pointer<PWSTR>} ServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} Level 
     * @param {Integer} Index Specifies the index of the first entry for which to retrieve information. Specify zero to retrieve account information beginning with the first display information entry. For more information, see the following Remarks section.
     * @param {Integer} EntriesRequested Specifies the maximum number of entries for which to retrieve information. On Windows 2000 and later, each call to 
     * <b>NetQueryDisplayInformation</b> returns a maximum of 100 objects.
     * @param {Integer} PreferredMaximumLength Specifies the preferred maximum size, in bytes, of the system-allocated buffer returned in the <i>SortedBuffer</i> parameter. It is recommended that you set this parameter to MAX_PREFERRED_LENGTH.
     * @param {Pointer<UInt32>} ReturnedEntryCount Pointer to a value that receives the number of entries in the buffer returned in the <i>SortedBuffer</i> parameter. If this parameter is zero, there are no entries with an index as large as that specified. Entries may be returned when the function's return value is either NERR_Success or ERROR_MORE_DATA.
     * @param {Pointer<Void>} SortedBuffer Pointer to a buffer that receives a pointer to a system-allocated buffer that specifies a sorted list of the requested information. The format of this data depends on the value of the <i>Level</i> parameter. Because this buffer is allocated by the system, it must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA. For more information, see the following Return Values section, and the topics 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Level</i> parameter specifies an invalid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. That is, the last entry returned in the <i>SortedBuffer</i> parameter is not the last entry available. To retrieve additional entries, call 
     * <b>NetQueryDisplayInformation</b> again with the <i>Index</i> parameter set to the value returned in the <b>next_index</b> member of the last entry in <i>SortedBuffer</i>. Note that you should not use the value of the <b>next_index</b> member for any purpose except to retrieve more data with additional calls to 
     * <b>NetQueryDisplayInformation</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netquerydisplayinformation
     * @since windows5.0
     */
    static NetQueryDisplayInformation(ServerName, Level, Index, EntriesRequested, PreferredMaximumLength, ReturnedEntryCount, SortedBuffer) {
        result := DllCall("NETAPI32.dll\NetQueryDisplayInformation", "ptr", ServerName, "uint", Level, "uint", Index, "uint", EntriesRequested, "uint", PreferredMaximumLength, "ptr", ReturnedEntryCount, "ptr", SortedBuffer, "uint")
        return result
    }

    /**
     * The NetGetDisplayInformationIndex function returns the index of the first display information entry whose name begins with a specified string or whose name alphabetically follows the string.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The function only returns information to which the caller has Read access. The caller must have List Contents access to the Domain object, and  Enumerate Entire SAM Domain access on the SAM Server object  located in the System container.
     * @param {Pointer<PWSTR>} ServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} Level 
     * @param {Pointer<PWSTR>} Prefix Pointer to a string that specifies the prefix for which to search.
     * @param {Pointer<UInt32>} Index Pointer to a value that receives the index of the requested entry.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>Level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There were no more items on which to operate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer name is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetdisplayinformationindex
     * @since windows5.0
     */
    static NetGetDisplayInformationIndex(ServerName, Level, Prefix, Index) {
        result := DllCall("NETAPI32.dll\NetGetDisplayInformationIndex", "ptr", ServerName, "uint", Level, "ptr", Prefix, "ptr", Index, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessAdd)
     * @remarks
     * This function requires User level security to be enabled.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level Specifies the information level of the data. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbBuffer</i> parameter points to an 
     *         <b>access_info_1</b> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} buf Pointer to the buffer that contains the access information structure.
     * @param {Pointer<UInt32>} parm_err Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessadd
     * @since windows5.0
     */
    static NetAccessAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetAccessAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessEnum)
     * @remarks
     * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} BasePath Pointer to a string that contains a base pathname for the resource. A <b>NULL</b> pointer or <b>NULL</b> string means no base path is to be used. The path can be specified as a universal naming convention (UNC) pathname.
     * @param {Integer} Recursive Specifies a flag that enables or disables recursive searching.
     * 
     * If this parameter is equal to zero, the <b>NetAccessEnum</b> function returns entries for the resource named as the base path by the <i>pszBasePath</i> parameter, and for the resources directly below that base path.
     * 
     * If this parameter is nonzero, the function returns entries for all access control lists (ACLs) that have <i>pszBasePath</i> at the beginning of the resource name.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
     * @param {Integer} prefmaxlen Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
     * @param {Pointer<UInt32>} entriesread Pointer to an unsigned short integer that receives the count of elements actually enumerated. The count is valid only if the 
     * <b>NetAccessEnum</b> function returns <b>NERR_Success</b> or <b>ERROR_MORE_DATA</b>.
     * @param {Pointer<UInt32>} totalentries Pointer to an unsigned short integer that receives the total number of entries that could have been enumerated. The count is valid only if the 
     * <b>NetAccessEnum</b> function returns <b>NERR_Success</b> or <b>ERROR_MORE_DATA</b>.
     * @param {Pointer<UInt32>} resume_handle TBD
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessenum
     * @since windows5.0
     */
    static NetAccessEnum(servername, BasePath, Recursive, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetAccessEnum", "ptr", servername, "ptr", BasePath, "uint", Recursive, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessGetInfo)
     * @remarks
     * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} resource 
     * @param {Integer} level Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
     * @param {Pointer<Byte>} bufptr Specifies the size, in bytes, of the buffer pointed to by the <i>pbBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessgetinfo
     * @since windows5.0
     */
    static NetAccessGetInfo(servername, resource, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetAccessGetInfo", "ptr", servername, "ptr", resource, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessSetInfo)
     * @remarks
     * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} resource Pointer to a string that contains the name of the network resource to modify.
     * @param {Integer} level Specifies the information level of the data. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbBuffer</i> parameter points to an 
     * <b>access_info_1</b> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} buf Pointer to the buffer that contains the access information structure. The format of this data depends on the value of the <i>sLevel</i> parameter.
     * @param {Pointer<UInt32>} parm_err TBD
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccesssetinfo
     * @since windows5.0
     */
    static NetAccessSetInfo(servername, resource, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetAccessSetInfo", "ptr", servername, "ptr", resource, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessDel)
     * @remarks
     * This function requires Admin privilege to successfully execute on a computer that has local security enabled.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} resource Pointer to a string that contains the name of the network resource for which to remove the access control list.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessdel
     * @since windows5.0
     */
    static NetAccessDel(servername, resource) {
        result := DllCall("NETAPI32.dll\NetAccessDel", "ptr", servername, "ptr", resource, "uint")
        return result
    }

    /**
     * Not supported. (NetAccessGetUserPerms)
     * @remarks
     * This function requires Admin privilege to successfully execute on a computer that has local security enabled. When users request their own access permissions, no special privilege is required.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} UGname Pointer to a string that specifies the name of the user or group to query.
     * @param {Pointer<PWSTR>} resource Pointer to a string that contains the name of the network resource to query.
     * @param {Pointer<UInt32>} Perms Pointer to an unsigned short integer that receives the user permissions for the specified resource.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaccessgetuserperms
     * @since windows5.0
     */
    static NetAccessGetUserPerms(servername, UGname, resource, Perms) {
        result := DllCall("NETAPI32.dll\NetAccessGetUserPerms", "ptr", servername, "ptr", UGname, "ptr", resource, "ptr", Perms, "uint")
        return result
    }

    /**
     * The NetValidatePasswordPolicy function allows an application to check password compliance against an application-provided account database and verify that passwords meet the complexity, aging, minimum length, and history reuse requirements of a password policy.
     * @remarks
     * The <b>NetValidatePasswordPolicy</b> function is designed to allow applications to validate passwords for users that are in an account database provided by the application. This function can also be used to verify that passwords meet the complexity, aging, minimum length, and history reuse requirements of a password policy. This function also provides the means for an application to implement an account-lockout mechanism.
     * 
     * The <b>NetValidatePasswordPolicy</b> function does not validate passwords in Active Directory accounts and cannot be used for this purpose.
     * The only policy that this function checks a password against in Active Directory accounts is the password complexity (the password strength). 
     * 
     * A typical scenario for the use of the <b>NetValidatePasswordPolicy</b> function would be enforcing the choice of strong passwords by users for web applications and applications that allow password-protected documents. Another use of this function could be checking password complexity in a situation in which a password is attached to a functional operation rather than to a user account; for example, passwords that are used with Secure Multipurpose Internet Mail Extensions (S/MIME) certificate-based public keys.
     * 
     * If the <b>NetValidatePasswordPolicy</b> function is called on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">securable object</a>. The default ACL permits all authenticated users and members of the "<a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. If you call this function on a member server or workstation, all authenticated users can view the information. For  information about anonymous access and restricting anonymous access on these platforms, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * The security descriptor of the Domain object is used to perform the access check for the <b>NetValidatePasswordPolicy</b> function. 
     * 
     * To call <b>NetValidatePasswordPolicy</b> in a security context that is not the default, first call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, specifying LOGON32_LOGON_NEW_CREDENTIALS in the <i>dwLogonType</i> parameter, and then call <b>NetValidatePasswordPolicy</b> under impersonation. For more information about impersonation, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/client-impersonation">Client Impersonation</a>.
     * 
     * If the return code of the <b>NetValidatePasswordPolicy</b> function is <b>Nerr_Success</b> then the function
     *         allocates a buffer pointed to by the <i>OutputArg</i> parameter that contains a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_output_arg">NET_VALIDATE_OUTPUT_ARG</a> structure with the results of
     *         the operation. The application must examine <b>ValidationStatus</b> member in the <b>NET_VALIDATE_OUTPUT_ARG</b> structure to
     *         determine the results of the password policy validation check.  For more information, see <b>NET_VALIDATE_OUTPUT_ARG</b>.
     * 
     * Note that it is the application's responsibility to save all the data in the <b>ChangedPersistedFields</b> member of the <b>NET_VALIDATE_OUTPUT_ARG</b> structure as well as any User object information. The next time the application calls <b>NetValidatePasswordPolicy</b> on the same instance of the User object, the application must provide the required fields from the persistent information.
     * 
     * When you call <b>NetValidatePasswordPolicy</b> and specify <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> or <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_reset_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> in <i>InputArg</i> parameter, the call also validates the password by passing it through the password filter DLL that the computer is configured to use. For more information about password filters, see <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/using-password-filters">Using Password Filters</a>.
     * 
     * If the return value from the <b>NetValidatePasswordPolicy</b> function is nonzero then <i>OutputArg</i> parameter  is set to <b>NULL</b> and password policy
     *         could not be examined.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicyfree">NetValidatePasswordPolicyFree</a> function should be called after calling  <b>NetValidatePasswordPolicy</b> to free the memory allocated for the <i>OutputArg</i> parameter that is returned by the call to the <b>NetValidatePasswordPolicy</b> function.
     * @param {Pointer<PWSTR>} ServerName A pointer to a constant Unicode string specifying the name of the remote server on which the function is to execute. This string must
     *         begin with \\ followed by the remote server name. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<Void>} Qualifier Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Integer} ValidationType The type of password validation to perform. This parameter must be one of the following enumerated constant values. 
     * 
     * 
     * 
     * 
     * 
     * ```cpp
     * typedef enum _NET_VALIDATE_PASSWORD_TYPE {
     * 
     *     NetValidateAuthentication = 1,
     *     NetValidatePasswordChange,
     *     NetValidatePasswordReset,
     * 
     * } NET_VALIDATE_PASSWORD_TYPE, *PNET_VALIDATE_PASSWORD_TYPE;
     * 
     * ```
     * 
     * 
     * These values have the following meanings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetValidateAuthentication"></a><a id="netvalidateauthentication"></a><a id="NETVALIDATEAUTHENTICATION"></a><dl>
     * <dt><b>NetValidateAuthentication</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is requesting password validation during authentication. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_authentication_input_arg">NET_VALIDATE_AUTHENTICATION_INPUT_ARG</a> structure. This type of validation enforces password expiration and account lockout policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetValidatePasswordChange"></a><a id="netvalidatepasswordchange"></a><a id="NETVALIDATEPASSWORDCHANGE"></a><dl>
     * <dt><b>NetValidatePasswordChange</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is requesting password validation during a password change operation. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetValidatePasswordReset"></a><a id="netvalidatepasswordreset"></a><a id="NETVALIDATEPASSWORDRESET"></a><dl>
     * <dt><b>NetValidatePasswordReset</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is requesting password validation during a password reset operation. The <i>InputArg</i> parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_reset_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> structure. You can also reset the "lockout state" of a user account by specifying this structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} InputArg A pointer to a structure that depends on the type of password validation to perform. The type of structure depends on the value of the <i>ValidationType</i> parameter. For more information, see the description of the <i>ValidationType</i> parameter.
     * @param {Pointer<Void>} OutputArg If the <b>NetValidatePasswordPolicy</b> function succeeds (the return value is <b>Nerr_Success</b>), then the function
     *         allocates a buffer that contains the results of
     *         the operation. The <i>OutputArg</i> parameter contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_output_arg">NET_VALIDATE_OUTPUT_ARG</a> structure. The application must examine <b>ValidationStatus</b> member in the <b>NET_VALIDATE_OUTPUT_ARG</b> structure pointed to by the <i>OutputArg</i> parameter to
     *         determine the results of the password policy validation check.   The <b>NET_VALIDATE_OUTPUT_ARG</b> structure contains a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure with changes to persistent password-related information, and the results of the password validation. The application must
     *         plan to persist all persisted the fields in the <b>NET_VALIDATE_PERSISTED_FIELDS</b> structure aside from the <b>ValidationStatus</b> member as information along with the user object information and provide the required fields from
     *         the persisted information when calling this function in the future on the same user object.
     * 
     * If the <b>NetValidatePasswordPolicy</b> function fails (the return value is nonzero),  then <i>OutputArg</i> parameter is set to a <b>NULL</b> pointer and password policy
     *         could not be examined.
     * 
     * For more information, see the Return Values and Remarks sections.
     * @returns {Integer} If the function succeeds, and the password is authenticated, changed, or reset, the return value is NERR_Success and the function allocates an <i>OutputArg</i> parameter.
     * 
     * If the function fails, the <i>OutputArg</i> parameter is <b>NULL</b> and the return value is a system error code that can be one of the following error codes. For a list of all possible error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>InputArg</i>  or <i>OutputArg</i> parameters are <b>NULL</b>. This error is also returned if the <i>Qualifier</i> parameter is not <b>NULL</b> or if the <i>ValidationType</i> parameter is not one of the allowed values. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy
     * @since windowsserver2003
     */
    static NetValidatePasswordPolicy(ServerName, Qualifier, ValidationType, InputArg, OutputArg) {
        result := DllCall("NETAPI32.dll\NetValidatePasswordPolicy", "ptr", ServerName, "ptr", Qualifier, "int", ValidationType, "ptr", InputArg, "ptr", OutputArg, "uint")
        return result
    }

    /**
     * The NetValidatePasswordPolicyFree function frees the memory that the NetValidatePasswordPolicy function allocates for the OutputArg parameter, which is a NET_VALIDATE_OUTPUT_ARG structure.
     * @remarks
     * No special group membership is required to successfully execute this function.
     * @param {Pointer<Void>} OutputArg Pointer to the memory allocated for the <i>OutputArg</i> parameter by a call to the <b>NetValidatePasswordPolicy</b> function.
     * @returns {Integer} If the function frees the memory, or if there is no memory to free from a previous call to <b>NetValidatePasswordPolicy</b>, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicyfree
     * @since windowsserver2003
     */
    static NetValidatePasswordPolicyFree(OutputArg) {
        result := DllCall("NETAPI32.dll\NetValidatePasswordPolicyFree", "ptr", OutputArg, "uint")
        return result
    }

    /**
     * The NetGetDCName function returns the name of the primary domain controller (PDC). It does not return the name of the backup domain controller (BDC) for the specified domain. Also, you cannot remote this function to a non-PDC server.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetGetDCName</b> function.
     * @param {Pointer<PWSTR>} ServerName 
     * @param {Pointer<PWSTR>} DomainName 
     * @param {Pointer<Byte>} Buffer 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_DCNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find the domain controller for the domain specified in the <i>domainname</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network path was not found. This error is returned if the computer specified in the <i>servername</i> parameter could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is incorrect. This error is returned if the name specified in the <i>servername</i> parameter contains illegal characters. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetdcname
     * @since windows5.0
     */
    static NetGetDCName(ServerName, DomainName, Buffer) {
        result := DllCall("NETAPI32.dll\NetGetDCName", "ptr", ServerName, "ptr", DomainName, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The NetGetAnyDCName function returns the name of any domain controller (DC) for a domain that is directly trusted by the specified server.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetGetAnyDCName</b> function.
     * 
     * If <i>servername</i> specifies a stand-alone workstation or a stand-alone server, no <i>domainname</i> is valid.
     * 
     * If <i>servername</i> specifies a workstation that is a member of a domain, or a server that is a member of a domain, the <i>domainname</i> must be in the same domain as <i>servername</i>.
     * 
     * If <i>servername</i> specifies a domain controller, the <i>domainname</i> must be one of the domains trusted by the domain for which the server is a controller. The domain controller that this call finds has been operational at least once during this call.
     * @param {Pointer<PWSTR>} ServerName 
     * @param {Pointer<PWSTR>} DomainName 
     * @param {Pointer<Byte>} Buffer 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_LOGON_SERVERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No domain controllers could be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain is not a trusted domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_TRUST_LSA_SECRET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client side of the trust relationship is broken.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_TRUST_SAM_ACCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server side of the trust relationship is broken or the password is broken.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DOMAIN_TRUST_INCONSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server that responded is not a proper domain controller of the specified domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netgetanydcname
     * @since windows5.0
     */
    static NetGetAnyDCName(ServerName, DomainName, Buffer) {
        result := DllCall("NETAPI32.dll\NetGetAnyDCName", "ptr", ServerName, "ptr", DomainName, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Controls various aspects of the Netlogon service.
     * @remarks
     * This function can be used to request that a BDC ensure that its copy of the SAM database is brought up-to-date. It can also be used to determine if a BDC currently has a secure channel open to the PDC.
     * @param {Pointer<PWSTR>} ServerName The name of the remote server.
     * @param {Integer} FunctionCode The operation to be performed. This value  can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_QUERY"></a><a id="netlogon_control_query"></a><dl>
     * <dt><b>NETLOGON_CONTROL_QUERY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No operation. Returns only the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_REPLICATE"></a><a id="netlogon_control_replicate"></a><dl>
     * <dt><b>NETLOGON_CONTROL_REPLICATE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces the security account manager (SAM) database on a backup domain controller (BDC) to be brought in sync with the copy on the primary domain controller (PDC). This operation does not imply a full synchronize. The Netlogon service replicates any outstanding differences if possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_SYNCHRONIZE"></a><a id="netlogon_control_synchronize"></a><dl>
     * <dt><b>NETLOGON_CONTROL_SYNCHRONIZE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a BDC to get a new copy of the SAM database from the PDC. This operation performs a full synchronize.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_PDC_REPLICATE"></a><a id="netlogon_control_pdc_replicate"></a><dl>
     * <dt><b>NETLOGON_CONTROL_PDC_REPLICATE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a PDC to ask for each BDC to replicate now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_REDISCOVER"></a><a id="netlogon_control_rediscover"></a><dl>
     * <dt><b>NETLOGON_CONTROL_REDISCOVER</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a domain controller (DC) to rediscover the specified trusted domain DC.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_TC_QUERY"></a><a id="netlogon_control_tc_query"></a><dl>
     * <dt><b>NETLOGON_CONTROL_TC_QUERY</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries  the secure channel, requesting a status update about its last usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_TC_VERIFY"></a><a id="netlogon_control_tc_verify"></a><dl>
     * <dt><b>NETLOGON_CONTROL_TC_VERIFY</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verifies the current status of the specified trusted domain secure channel. If the status indicates success, the domain controller is pinged. If the status or the ping indicates failure, a new trusted domain controller is rediscovered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_CHANGE_PASSWORD"></a><a id="netlogon_control_change_password"></a><dl>
     * <dt><b>NETLOGON_CONTROL_CHANGE_PASSWORD</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a password change on a secure channel to a trusted domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_FORCE_DNS_REG"></a><a id="netlogon_control_force_dns_reg"></a><dl>
     * <dt><b>NETLOGON_CONTROL_FORCE_DNS_REG</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces the domain controller to re-register all of its DNS records. The <i>QueryLevel</i> parameter must be set to 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_CONTROL_QUERY_DNS_REG"></a><a id="netlogon_control_query_dns_reg"></a><dl>
     * <dt><b>NETLOGON_CONTROL_QUERY_DNS_REG</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Issues a query requesting the status of DNS updates performed by the Netlogon service. If any DNS registration or deregistration errors occurred on the last update, the result is negative. The <i>QueryLevel</i> parameter must be set to 1.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} QueryLevel Indicates what information should be returned from the Netlogon service. This value can be any of the following structures.
     * @param {Pointer<Byte>} Data Carries input data that depends on the value specified in the <i>FunctionCode</i> parameter. The NETLOGON_CONTROL_REDISCOVER and NETLOGON_CONTROL_TC_QUERY function codes specify the trusted domain name (the data type is <b>LPWSTR *</b>).
     * @param {Pointer<Byte>} Buffer Returns a pointer to a buffer that contains the requested information in the structure passed in the <i>QueryLevel</i> parameter.
     * 
     *  The buffer must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} The method returns 0x00000000 (<b>NERR_Success</b>) on success; otherwise, it returns a nonzero error code defined in Lmerr.h or Winerror.h. NET_API_STATUS error codes begin with the value 0x00000834. For more information about network management error codes, see <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-error-codes">Network_Management_Error_Codes</a>. The following table describes possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>NERR_Success</b></b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method call completed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>0x00000005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access validation on the caller returns false. Access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>0x00000032</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A function code is not valid on the specified
     *         server.  For example,  NETLOGON_CONTROL_REPLICATE might have been passed to a primary domain controller (PDC).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>0x00000057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * <dt>0x0000007C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query call level is not correct.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * <dt>0x000004261210121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> ERROR_INVALID_COMPUTERNAME</b></dt>
     * <dt> 0x000004BA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the specified computer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_LOGON_SERVERS</b></dt>
     * <dt>0x0000051F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are currently no logon servers available to service the logon request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
     * <dt>0x0000054A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Password change for an interdomain trust account was attempted  on a backup domain controller (BDC). This operation is only allowed for the PDC of the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * <dt>0x0000054B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain either does not exist or could not be contacted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserNotFound</b></dt>
     * <dt>0x000008AD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-i_netlogoncontrol2
     */
    static I_NetLogonControl2(ServerName, FunctionCode, QueryLevel, Data, Buffer) {
        result := DllCall("NETAPI32.dll\I_NetLogonControl2", "ptr", ServerName, "uint", FunctionCode, "uint", QueryLevel, "ptr", Data, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Creates a standalone managed service account (sMSA) or retrieves the credentials for a group managed service account (gMSA) and stores the account information on the local computer.
     * @param {Pointer<PWSTR>} ServerName The value of this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} AccountName The name of the account to be created.
     * @param {Pointer<PWSTR>} Password This parameter is reserved. Do not use it.
     * @param {Integer} Flags This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY"></a><a id="service_account_flag_link_to_host_only"></a><dl>
     * <dt><b>SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No standalone managed service account is created. If a service account with the specified name exists, it is linked to the local computer. This flag is ignored if the account name is an existing gMSA.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netaddserviceaccount
     * @since windows6.1
     */
    static NetAddServiceAccount(ServerName, AccountName, Password, Flags) {
        result := DllCall("NETAPI32.dll\NetAddServiceAccount", "ptr", ServerName, "ptr", AccountName, "ptr", Password, "uint", Flags, "int")
        return result
    }

    /**
     * Deletes the specified service account from the Active Directory database if the account is a standalone managed service account (sMSA).
     * @param {Pointer<PWSTR>} ServerName The value of this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} AccountName The name of the account to be deleted.
     * @param {Integer} Flags This parameter can have the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY"></a><a id="service_account_flag_unlink_from_host_only"></a><dl>
     * <dt><b>SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For sMSAs, the service account object is unlinked from the local computer and the secret stored in the LSA is deleted. The service account object is not deleted from the Active Directory database. This flag has no meaning for gMSAs.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netremoveserviceaccount
     * @since windows6.1
     */
    static NetRemoveServiceAccount(ServerName, AccountName, Flags) {
        result := DllCall("NETAPI32.dll\NetRemoveServiceAccount", "ptr", ServerName, "ptr", AccountName, "uint", Flags, "int")
        return result
    }

    /**
     * Enumerates the standalone managed service accounts (sMSA) on the specified server.
     * @param {Pointer<PWSTR>} ServerName The value of this parameter must be <b>NULL</b>.
     * @param {Integer} Flags This parameter is reserved. Do not use it.
     * @param {Pointer<UInt32>} AccountsCount The number of elements in the <i>Accounts</i> array.
     * @param {Pointer<UInt16>} Accounts A pointer to an array of the names of the service accounts on the specified server.
     * 
     * When you have finished using the names, free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netenumerateserviceaccounts
     * @since windows6.1
     */
    static NetEnumerateServiceAccounts(ServerName, Flags, AccountsCount, Accounts) {
        result := DllCall("NETAPI32.dll\NetEnumerateServiceAccounts", "ptr", ServerName, "uint", Flags, "ptr", AccountsCount, "ptr", Accounts, "int")
        return result
    }

    /**
     * Tests whether the specified standalone managed service account (sMSA) or group managed service account (gMSA) exists in the Netlogon store on the specified server.
     * @param {Pointer<PWSTR>} ServerName The value of this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} AccountName The name of the account to be tested.
     * @param {Pointer<Int32>} IsService <b>TRUE</b> if the specified service account exists on the specified server; otherwise, <b>FALSE</b>.
     * @returns {Integer} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netisserviceaccount
     * @since windows6.1
     */
    static NetIsServiceAccount(ServerName, AccountName, IsService) {
        result := DllCall("NETAPI32.dll\NetIsServiceAccount", "ptr", ServerName, "ptr", AccountName, "ptr", IsService, "int")
        return result
    }

    /**
     * Gets information about the specified managed service account.
     * @param {Pointer<PWSTR>} ServerName The value of this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} AccountName The name of the account to be created.
     * @param {Integer} InfoLevel Specifies the format of the data returned in the <i>Buffer</i> parameter. This can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Buffer</i> parameter contains an <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-msa_info_0">MSA_INFO_0</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} Buffer Information about the specified service account.
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmaccess/nf-lmaccess-netqueryserviceaccount
     * @since windows6.1
     */
    static NetQueryServiceAccount(ServerName, AccountName, InfoLevel, Buffer) {
        result := DllCall("NETAPI32.dll\NetQueryServiceAccount", "ptr", ServerName, "ptr", AccountName, "uint", InfoLevel, "ptr", Buffer, "int")
        return result
    }

    /**
     * The NetAlertRaise function notifies all registered clients when a particular event occurs.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetAlertRaise</b> function.
     * 
     * The alerter service must be running on the client computer when you call the 
     * <b>NetAlertRaise</b> function, or the function fails with ERROR_FILE_NOT_FOUND.
     * @param {Pointer<PWSTR>} AlertType A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. The event name for an alert can be any text string. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ADMIN_EVENT"></a><a id="alert_admin_event"></a><dl>
     * <dt><b>ALERT_ADMIN_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator's intervention is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ERRORLOG_EVENT"></a><a id="alert_errorlog_event"></a><dl>
     * <dt><b>ALERT_ERRORLOG_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry was added to the error log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_MESSAGE_EVENT"></a><a id="alert_message_event"></a><dl>
     * <dt><b>ALERT_MESSAGE_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user or application received a broadcast message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_PRINT_EVENT"></a><a id="alert_print_event"></a><dl>
     * <dt><b>ALERT_PRINT_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A print job completed or a print error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_USER_EVENT"></a><a id="alert_user_event"></a><dl>
     * <dt><b>ALERT_USER_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application or resource was used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Buffer A pointer to the data to send to the clients listening for the interrupting message. The data should begin with a fixed-length 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure followed by additional message data in one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-errlog_other_info">ERRLOG_OTHER_INFO</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-print_other_info">PRINT_OTHER_INFO</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-user_other_info">USER_OTHER_INFO</a> structure. Finally, the buffer should include any required variable-length information. For more information, see the code sample in the following Remarks section. 
     * 
     * 
     * 
     * 
     * The calling application must allocate and free the memory for all structures and variable data. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} BufferSize The size, in bytes, of the message buffer.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code and a can be one of the following error codes. For a list of all possible error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>AlertEventName</i>  parameter is <b>NULL</b> or an empty string, the <i>Buffer</i>  parameter is <b>NULL</b>, or the <i>BufferSize</i>  parameter is less than the size of the <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure plus the fixed size for the additional message data structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned on Windows Vista and later since the Alerter service is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmalert/nf-lmalert-netalertraise
     * @since windows5.0
     */
    static NetAlertRaise(AlertType, Buffer, BufferSize) {
        result := DllCall("NETAPI32.dll\NetAlertRaise", "ptr", AlertType, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * The NetAlertRaiseEx function notifies all registered clients when a particular event occurs. You can call this extended function to simplify the sending of an alert message because NetAlertRaiseEx does not require that you specify a STD_ALERT structure.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetAlertRaiseEx</b> function.
     * 
     * The alerter service must be running on the client computer when you call the 
     * <b>NetAlertRaiseEx</b> function, or the function fails with ERROR_FILE_NOT_FOUND.
     * @param {Pointer<PWSTR>} AlertType A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. (The event name for an alert can be any text string.) 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ADMIN_EVENT"></a><a id="alert_admin_event"></a><dl>
     * <dt><b>ALERT_ADMIN_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator's intervention is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ERRORLOG_EVENT"></a><a id="alert_errorlog_event"></a><dl>
     * <dt><b>ALERT_ERRORLOG_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry was added to the error log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_MESSAGE_EVENT"></a><a id="alert_message_event"></a><dl>
     * <dt><b>ALERT_MESSAGE_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user or application received a broadcast message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_PRINT_EVENT"></a><a id="alert_print_event"></a><dl>
     * <dt><b>ALERT_PRINT_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A print job completed or a print error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_USER_EVENT"></a><a id="alert_user_event"></a><dl>
     * <dt><b>ALERT_USER_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application or resource was used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} VariableInfo A pointer to the data to send to the clients listening for the interrupting message. The data should consist of one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-errlog_other_info">ERRLOG_OTHER_INFO</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-print_other_info">PRINT_OTHER_INFO</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-user_other_info">USER_OTHER_INFO</a> structure followed by any required variable-length information. For more information, see the code sample in the following Remarks section. 
     * 
     * 
     * 
     * 
     * The calling application must allocate and free the memory for all structures and variable data. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} VariableInfoSize The number of bytes of variable information in the buffer pointed to by the <i>VariableInfo</i> parameter.
     * @param {Pointer<PWSTR>} ServiceName A pointer to a constant string that specifies the name of the service raising the interrupting message.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code and a can be one of the following error codes. For a list of all possible error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>AlertEventName</i>  parameter is <b>NULL</b> or an empty string, the <i>ServiceName</i>  parameter is <b>NULL</b> or an empty string, the <i>VariableInfo</i>  parameter is <b>NULL</b>, or the <i>VariableInfoSize</i>  parameter is greater than 512 minus the size of the <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-std_alert">STD_ALERT</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned on Windows Vista and later since the Alerter service is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmalert/nf-lmalert-netalertraiseex
     * @since windows5.0
     */
    static NetAlertRaiseEx(AlertType, VariableInfo, VariableInfoSize, ServiceName) {
        result := DllCall("NETAPI32.dll\NetAlertRaiseEx", "ptr", AlertType, "ptr", VariableInfo, "uint", VariableInfoSize, "ptr", ServiceName, "uint")
        return result
    }

    /**
     * The NetMessageNameAdd function registers a message alias in the message name table. The function requires that the messenger service be started.
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetMessageNameAdd</b> function on a remote server.
     * 
     * The forward action flag is no longer a parameter to the LAN Manager 2.<i>x</i><b>NetMessageNameAdd</b> function because message forwarding is no longer supported. If the 
     * <b>NetMessageNameAdd</b> function detects that a forwarded version of <i>msgname</i> exists on the network, the function will fail with error NERR_Already_Exists.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} msgname Pointer to a constant string that specifies the message alias to add. The string cannot be more than 15 characters long.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This request is not supported. This error is returned on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_AlreadyExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message alias already exists on this computer. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_DuplicateName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified is already in use as a message alias on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NetworkError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A general failure occurred in the network hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_TooManyNames</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of message aliases has been exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenameadd
     * @since windows5.0
     */
    static NetMessageNameAdd(servername, msgname) {
        result := DllCall("NETAPI32.dll\NetMessageNameAdd", "ptr", servername, "ptr", msgname, "uint")
        return result
    }

    /**
     * The NetMessageNameEnum function lists the message aliases that receive messages on a specified computer. The function requires that the messenger service be started.
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetMessageNameEnum</b> function on a remote server.
     * 
     * To retrieve information about a particular message alias in the message name table, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmmsg/nf-lmmsg-netmessagenamegetinfo">NetMessageNameGetInfo</a> function.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} resume_handle Pointer to a value that contains a resume handle which is used to continue an existing message alias search. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>resume_handle</i> is <b>NULL</b>, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This request is not supported. This error is returned on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BufTooSmall</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenameenum
     * @since windows5.0
     */
    static NetMessageNameEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetMessageNameEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetMessageNameGetInfo function retrieves information about a particular message alias in the message name table. The function requires that the messenger service be started.
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetMessageNameGetInfo</b> function on a remote server.
     * 
     * To list all the message aliases in a message name table, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmmsg/nf-lmmsg-netmessagenameenum">NetMessageNameEnum</a> function.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} msgname Pointer to a constant string that specifies the message alias for which to return information.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This request is not supported. This error is returned on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotLocalName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message alias is not on the local computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenamegetinfo
     * @since windows5.0
     */
    static NetMessageNameGetInfo(servername, msgname, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetMessageNameGetInfo", "ptr", servername, "ptr", msgname, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetMessageNameDel function deletes a message alias in the message name table. The function requires that the messenger service be started.
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetMessageNameDel</b> function on a remote server.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} msgname Pointer to a constant string that specifies the message alias to delete. The string cannot be more than 15 characters long.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This request is not supported. This error is returned on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_DelComputerName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A message alias that is also a computer name cannot be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_IncompleteDel</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message alias was not successfully deleted from all networks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NameInUse</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message alias is currently in use. Try again later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NotLocalName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message alias is not on the local computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagenamedel
     * @since windows5.0
     */
    static NetMessageNameDel(servername, msgname) {
        result := DllCall("NETAPI32.dll\NetMessageNameDel", "ptr", servername, "ptr", msgname, "uint")
        return result
    }

    /**
     * The NetMessageBufferSend function sends a buffer of information to a registered message alias.
     * @remarks
     * If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits only Domain Admins and Account Operators to call this function. On a member server or workstation, only Administrators and Server Operators can call this function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs and ACEs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} msgname Pointer to a constant string that specifies the message alias to which the message buffer should be sent.
     * @param {Pointer<PWSTR>} fromname Pointer to a constant string specifying who the message is from. If this parameter is <b>NULL</b>, the message is sent from the local computer name.
     * @param {Pointer<Byte>} buf Pointer to a buffer that contains the message text. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Integer} buflen Specifies a value that contains the length, in bytes, of the message text pointed to by the <i>buf</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate
     *         access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This request is not supported. This error is returned on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NameNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NetworkError</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A general failure occurred in the network hardware.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmmsg/nf-lmmsg-netmessagebuffersend
     * @since windows5.0
     */
    static NetMessageBufferSend(servername, msgname, fromname, buf, buflen) {
        result := DllCall("NETAPI32.dll\NetMessageBufferSend", "ptr", servername, "ptr", msgname, "ptr", fromname, "ptr", buf, "uint", buflen, "uint")
        return result
    }

    /**
     * The NetRemoteTOD function returns the time of day information from a specified server.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetRemoteTOD</b> function.
     * @param {Pointer<PWSTR>} UncServerName Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<Byte>} BufferPtr Pointer to the address that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmremutl/ns-lmremutl-time_of_day_info">TIME_OF_DAY_INFO</a> information structure. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmremutl/nf-lmremutl-netremotetod
     * @since windows5.0
     */
    static NetRemoteTOD(UncServerName, BufferPtr) {
        result := DllCall("NETAPI32.dll\NetRemoteTOD", "ptr", UncServerName, "ptr", BufferPtr, "uint")
        return result
    }

    /**
     * The NetRemoteComputerSupports function queries the redirector to retrieve the optional features the remote system supports.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetRemoteComputerSupports</b> function.
     * @param {Pointer<PWSTR>} UncServerName Pointer to a constant string that specifies the name of the remote server to query. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} OptionsWanted 
     * @param {Pointer<UInt32>} OptionsSupported Pointer to a value that receives a set of bit flags. The flags indicate which features specified by the <i>OptionsWanted</i> parameter are implemented on the computer specified by the <i>UncServerName</i> parameter. (All other bits are set to zero.) 
     * 
     * 
     * 
     * 
     * The value of this parameter is valid only when the 
     * <b>NetRemoteComputerSupports</b> function returns NERR_Success.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the <i>OptionsWanted</i> parameter or the <i>OptionsSupported</i> parameter is <b>NULL</b>; both parameters are required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmremutl/nf-lmremutl-netremotecomputersupports
     * @since windows5.0
     */
    static NetRemoteComputerSupports(UncServerName, OptionsWanted, OptionsSupported) {
        result := DllCall("NETAPI32.dll\NetRemoteComputerSupports", "ptr", UncServerName, "uint", OptionsWanted, "ptr", OptionsSupported, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     */
    static NetReplGetInfo(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetReplGetInfo", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf 
     * @param {Pointer<UInt32>} parm_err 
     * @returns {Integer} 
     */
    static NetReplSetInfo(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetReplSetInfo", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf 
     * @param {Pointer<UInt32>} parm_err 
     * @returns {Integer} 
     */
    static NetReplExportDirAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetReplExportDirAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @returns {Integer} 
     */
    static NetReplExportDirDel(servername, dirname) {
        result := DllCall("NETAPI32.dll\NetReplExportDirDel", "ptr", servername, "ptr", dirname, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @param {Integer} prefmaxlen 
     * @param {Pointer<UInt32>} entriesread 
     * @param {Pointer<UInt32>} totalentries 
     * @param {Pointer<UInt32>} resumehandle 
     * @returns {Integer} 
     */
    static NetReplExportDirEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
        result := DllCall("NETAPI32.dll\NetReplExportDirEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resumehandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     */
    static NetReplExportDirGetInfo(servername, dirname, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetReplExportDirGetInfo", "ptr", servername, "ptr", dirname, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf 
     * @param {Pointer<UInt32>} parm_err 
     * @returns {Integer} 
     */
    static NetReplExportDirSetInfo(servername, dirname, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetReplExportDirSetInfo", "ptr", servername, "ptr", dirname, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @returns {Integer} 
     */
    static NetReplExportDirLock(servername, dirname) {
        result := DllCall("NETAPI32.dll\NetReplExportDirLock", "ptr", servername, "ptr", dirname, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @param {Integer} unlockforce 
     * @returns {Integer} 
     */
    static NetReplExportDirUnlock(servername, dirname, unlockforce) {
        result := DllCall("NETAPI32.dll\NetReplExportDirUnlock", "ptr", servername, "ptr", dirname, "uint", unlockforce, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf 
     * @param {Pointer<UInt32>} parm_err 
     * @returns {Integer} 
     */
    static NetReplImportDirAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetReplImportDirAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @returns {Integer} 
     */
    static NetReplImportDirDel(servername, dirname) {
        result := DllCall("NETAPI32.dll\NetReplImportDirDel", "ptr", servername, "ptr", dirname, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @param {Integer} prefmaxlen 
     * @param {Pointer<UInt32>} entriesread 
     * @param {Pointer<UInt32>} totalentries 
     * @param {Pointer<UInt32>} resumehandle 
     * @returns {Integer} 
     */
    static NetReplImportDirEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
        result := DllCall("NETAPI32.dll\NetReplImportDirEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resumehandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     */
    static NetReplImportDirGetInfo(servername, dirname, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetReplImportDirGetInfo", "ptr", servername, "ptr", dirname, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @returns {Integer} 
     */
    static NetReplImportDirLock(servername, dirname) {
        result := DllCall("NETAPI32.dll\NetReplImportDirLock", "ptr", servername, "ptr", dirname, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} dirname 
     * @param {Integer} unlockforce 
     * @returns {Integer} 
     */
    static NetReplImportDirUnlock(servername, dirname, unlockforce) {
        result := DllCall("NETAPI32.dll\NetReplImportDirUnlock", "ptr", servername, "ptr", dirname, "uint", unlockforce, "uint")
        return result
    }

    /**
     * The NetServerEnum function lists all servers of the specified type that are visible in a domain.
     * @remarks
     * The
     * 				<b>NetServerEnum</b> function is used to list all servers of the specified type that are visible in a domain. For example, an application can call 
     * <b>NetServerEnum</b> to list all domain controllers only or all servers that run instances of SQL server only.
     * 
     * An application combine the bit masks for various server types in the <i>servertype</i> parameter to list several types. For example, a value of SV_TYPE_WORKSTATION | SVTYPE_SERVER (0x00000003) combines the bit masks for SV_TYPE_WORKSTATION (0x00000001) and SV_TYPE_SERVER (0x00000002).
     * 
     * If you require more information for a specific server, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function.
     * 
     * No special group membership is required to successfully execute the 
     * <b>NetServerEnum</b> function.
     * 
     * If you specify the value SV_TYPE_LOCAL_LIST_ONLY, the 
     * <b>NetServerEnum</b> function returns the list of servers that the browser maintains internally. This has meaning only on the master browser (or on a computer that has been the master browser in the past). The master browser is the computer that currently has rights to determine which computers can be servers or workstations on the network.
     * 
     * If there are no servers found that match the types specified in the <i>servertype</i> parameter, the 
     * <b>NetServerEnum</b> function returns the <i>bufptr</i> parameter as <b>NULL</b> and DWORD values pointed to by the <i>entriesread</i> and <i>totalentries</i> parameters are set to zero.
     * 
     * The 
     * <b>NetServerEnum</b> function depends on the browser service being installed and running. If no browser servers are found, then <b>NetServerEnum</b> fails with ERROR_NO_BROWSER_SERVERS_FOUND.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same function you can achieve by calling the network management server functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * @param {Pointer<PWSTR>} servername Reserved; must be <b>NULL</b>.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of visible servers and workstations on the network. Note that applications should consider this value only as a hint.
     * @param {Integer} servertype 
     * @param {Pointer<PWSTR>} domain A pointer to a constant string that specifies the name of the domain for which a list of servers is to be returned. The domain name must be a NetBIOS domain name (for example, microsoft). 
     * The <b>NetServerEnum</b> function does not support DNS-style names (for example, microsoft.com). 
     * 
     * If this parameter is <b>NULL</b>, the primary domain is implied.
     * @param {Pointer<UInt32>} resume_handle Reserved; must be set to zero.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_BROWSER_SERVERS_FOUND</b></dt>
     * <dt>6118</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No browser servers found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>50</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_RemoteErr</b></dt>
     * <dt>2127</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote error occurred with no data returned by the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ServerNotStarted</b></dt>
     * <dt>2114</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server service is not started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ServiceNotInstalled</b></dt>
     * <dt>2184</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * <dt>2138</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started. The local workstation service is used  to communicate with a downlevel remote server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserverenum
     * @since windows5.0
     */
    static NetServerEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, servertype, domain, resume_handle) {
        result := DllCall("NETAPI32.dll\NetServerEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "uint", servertype, "ptr", domain, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetServerGetInfo function retrieves current configuration information for the specified server.
     * @remarks
     * Only the Administrators or Server Operators local group, or those with Print or Server Operator group membership, can successfully execute the 
     * <b>NetServerGetInfo</b> function at level 102. No special group membership is required for level 100 or level 101 calls.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management server functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. 
     * 
     * 
     * 
     * 
     * This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * <dt>124</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ServerNotStarted</b></dt>
     * <dt>2114</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server service is not started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservergetinfo
     * @since windows5.0
     */
    static NetServerGetInfo(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetServerGetInfo", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServerSetInfo function sets a server's operating parameters; it can set them individually or collectively. The information is stored in a way that allows it to remain in effect after the system has been reinitialized.
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerSetInfo</b> function.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same functionality you can achieve by calling the network management server functions. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a>.
     * 
     * If the 
     * <b>NetServerSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>ParmError</i> parameter to indicate the first member of the server information structure that is invalid. (A server information structure begins with SERVER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>ParmError</i> parameter and the corresponding structure member that is in error. (The prefix sv*_ indicates that the member can begin with multiple prefixes, for example, sv101_ or sv402_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>SV_PLATFORM_ID_PARMNUM</td>
     * <td>sv*_platform_id</td>
     * </tr>
     * <tr>
     * <td>SV_NAME_PARMNUM</td>
     * <td>sv*_name</td>
     * </tr>
     * <tr>
     * <td>SV_VERSION_MAJOR_PARMNUM</td>
     * <td>sv*_version_major</td>
     * </tr>
     * <tr>
     * <td>SV_VERSION_MINOR_PARMNUM</td>
     * <td>sv*_version_minor</td>
     * </tr>
     * <tr>
     * <td>SV_TYPE_PARMNUM</td>
     * <td>sv*_type</td>
     * </tr>
     * <tr>
     * <td>SV_COMMENT_PARMNUM</td>
     * <td>sv*_comment</td>
     * </tr>
     * <tr>
     * <td>SV_USERS_PARMNUM</td>
     * <td>sv*_users</td>
     * </tr>
     * <tr>
     * <td>SV_DISC_PARMNUM</td>
     * <td>sv*_disc</td>
     * </tr>
     * <tr>
     * <td>SV_HIDDEN_PARMNUM</td>
     * <td>sv*_hidden</td>
     * </tr>
     * <tr>
     * <td>SV_ANNOUNCE_PARMNUM</td>
     * <td>sv*_announce</td>
     * </tr>
     * <tr>
     * <td>SV_ANNDELTA_PARMNUM</td>
     * <td>sv*_anndelta</td>
     * </tr>
     * <tr>
     * <td>SV_USERPATH_PARMNUM</td>
     * <td>sv*_userpath</td>
     * </tr>
     * <tr>
     * <td>SV_ULIST_MTIME_PARMNUM</td>
     * <td>sv*_ulist_mtime</td>
     * </tr>
     * <tr>
     * <td>SV_GLIST_MTIME_PARMNUM</td>
     * <td>sv*_glist_mtime</td>
     * </tr>
     * <tr>
     * <td>SV_ALIST_MTIME_PARMNUM</td>
     * <td>sv*_alist_mtime</td>
     * </tr>
     * <tr>
     * <td>SV_ALERTS_PARMNUM</td>
     * <td>sv*_alerts</td>
     * </tr>
     * <tr>
     * <td>SV_SECURITY_PARMNUM</td>
     * <td>sv*_security</td>
     * </tr>
     * <tr>
     * <td>SV_NUMADMIN_PARMNUM</td>
     * <td>sv*_numadmin</td>
     * </tr>
     * <tr>
     * <td>SV_LANMASK_PARMNUM</td>
     * <td>sv*_lanmask</td>
     * </tr>
     * <tr>
     * <td>SV_GUESTACC_PARMNUM</td>
     * <td>sv*_guestacc</td>
     * </tr>
     * <tr>
     * <td>SV_CHDEVQ_PARMNUM</td>
     * <td>sv*_chdevq</td>
     * </tr>
     * <tr>
     * <td>SV_CHDEVJOBS_PARMNUM</td>
     * <td>sv*_chdevjobs</td>
     * </tr>
     * <tr>
     * <td>SV_CONNECTIONS_PARMNUM</td>
     * <td>sv*_connections</td>
     * </tr>
     * <tr>
     * <td>SV_SHARES_PARMNUM</td>
     * <td>sv*_shares</td>
     * </tr>
     * <tr>
     * <td>SV_OPENFILES_PARMNUM</td>
     * <td>sv*_openfiles</td>
     * </tr>
     * <tr>
     * <td>SV_SESSOPENS_PARMNUM</td>
     * <td>sv*_sessopens</td>
     * </tr>
     * <tr>
     * <td>SV_SESSVCS_PARMNUM</td>
     * <td>sv*_sessvcs</td>
     * </tr>
     * <tr>
     * <td>SV_SESSREQS_PARMNUM</td>
     * <td>sv*_sessreqs</td>
     * </tr>
     * <tr>
     * <td>SV_OPENSEARCH_PARMNUM</td>
     * <td>sv*_opensearch</td>
     * </tr>
     * <tr>
     * <td>SV_ACTIVELOCKS_PARMNUM</td>
     * <td>sv*_activelocks</td>
     * </tr>
     * <tr>
     * <td>SV_NUMREQBUF_PARMNUM</td>
     * <td>sv*_numreqbuf</td>
     * </tr>
     * <tr>
     * <td>SV_SIZREQBUF_PARMNUM</td>
     * <td>sv*_sizreqbuf</td>
     * </tr>
     * <tr>
     * <td>SV_NUMBIGBUF_PARMNUM</td>
     * <td>sv*_numbigbuf</td>
     * </tr>
     * <tr>
     * <td>SV_NUMFILETASKS_PARMNUM</td>
     * <td>sv*_numfiletasks</td>
     * </tr>
     * <tr>
     * <td>SV_ALERTSCHED_PARMNUM</td>
     * <td>sv*_alertsched</td>
     * </tr>
     * <tr>
     * <td>SV_ERRORALERT_PARMNUM</td>
     * <td>sv*_erroralert</td>
     * </tr>
     * <tr>
     * <td>SV_LOGONALERT_PARMNUM</td>
     * <td>sv*_logonalert</td>
     * </tr>
     * <tr>
     * <td>SV_ACCESSALERT_PARMNUM</td>
     * <td>sv*_accessalert</td>
     * </tr>
     * <tr>
     * <td>SV_DISKALERT_PARMNUM</td>
     * <td>sv*_diskalert</td>
     * </tr>
     * <tr>
     * <td>SV_NETIOALERT_PARMNUM</td>
     * <td>sv*_netioalert</td>
     * </tr>
     * <tr>
     * <td>SV_MAXAUDITSZ_PARMNUM</td>
     * <td>sv*_maxauditsz</td>
     * </tr>
     * <tr>
     * <td>SV_SRVHEURISTICS_PARMNUM</td>
     * <td>sv*_srvheuristics</td>
     * </tr>
     * <tr>
     * <td>SV_TIMESOURCE_PARMNUM</td>
     * <td>sv*_timesource</td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to a buffer that receives the server information. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} ParmError Pointer to a value that receives the index of the first member of the server information structure that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserversetinfo
     * @since windows5.0
     */
    static NetServerSetInfo(servername, level, buf, ParmError) {
        result := DllCall("NETAPI32.dll\NetServerSetInfo", "ptr", servername, "uint", level, "ptr", buf, "ptr", ParmError, "uint")
        return result
    }

    /**
     * The NetServerDiskEnum function retrieves a list of disk drives on a server. The function returns an array of three-character strings (a drive letter, a colon, and a terminating null character).
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerDiskEnum</b> function on a remote computer.
     * 
     * If you are programming for Active Directory, you may be able to call certain Active Directory Service Interface (ADSI) methods to achieve the same results you can achieve by calling the network management server functions. For more information, see 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscomputer">IADsComputer</a> interface reference.
     * @param {Pointer<PWSTR>} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level The level of information required. A value of zero is the only valid level.
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The data is an array of three-character strings (a drive letter, a colon, and a terminating null character). This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>. 
     * 
     * <div class="alert"><b>Note</b>  This parameter is currently ignored.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing server disk search. The handle should be zero on the first call and left unchanged for subsequent calls. If the <i>resume_handle</i> parameter is a <b>NULL</b> pointer, then no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if a remote server was specified in <i>servername</i> parameter, the remote server only supports remote RPC calls using the legacy Remote Access Protocol mechanism, and this request is not supported. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netserverdiskenum
     * @since windows5.0
     */
    static NetServerDiskEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetServerDiskEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetServerComputerNameAdd function enumerates the transports on which the specified server is active, and binds the emulated server name to each of the transports.
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerComputerNameAdd</b> function.
     * 
     * The server specified by the <i>ServerName</i> parameter continues to support all names it was supporting, and additionally begins to support new names supplied by successful calls to the 
     * <b>NetServerComputerNameAdd</b> function.
     * 
     * Name emulation that results from a call to 
     * <b>NetServerComputerNameAdd</b> ceases when the server reboots or restarts. To discontinue name emulation set by a previous call to 
     * <b>NetServerComputerNameAdd</b> without restarting or rebooting, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservercomputernamedel">NetServerComputerNameDel</a> function.
     * 
     * The 
     * <b>NetServerComputerNameAdd</b> function is typically used when a system administrator replaces a server, but wants to keep the conversion transparent to users.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} EmulatedDomainName Pointer to a string that contains the domain name the specified server should use when announcing its presence using the <i>EmulatedServerName</i>. This parameter is optional.
     * @param {Pointer<PWSTR>} EmulatedServerName Pointer to a null-terminated character string that contains the emulated name the server should begin supporting in addition to the name specified by the <i>ServerName</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success. Note that 
     * <b>NetServerComputerNameAdd</b> succeeds if the emulated server name specified is added to at least one transport.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate name exists on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain name could not be found on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservercomputernameadd
     * @since windows5.0
     */
    static NetServerComputerNameAdd(ServerName, EmulatedDomainName, EmulatedServerName) {
        result := DllCall("NETAPI32.dll\NetServerComputerNameAdd", "ptr", ServerName, "ptr", EmulatedDomainName, "ptr", EmulatedServerName, "uint")
        return result
    }

    /**
     * The NetServerComputerNameDel function causes the specified server to cease supporting the emulated server name set by a previous call to the NetServerComputerNameAdd function. The function does this by unbinding network transports from the emulated name.
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerComputerNameDel</b> function.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} EmulatedServerName Pointer to a null-terminated character string that contains the emulated name the server should stop supporting. The server continues to support all other server names it was supporting.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NetNameNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The share name does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservercomputernamedel
     * @since windows5.0
     */
    static NetServerComputerNameDel(ServerName, EmulatedServerName) {
        result := DllCall("NETAPI32.dll\NetServerComputerNameDel", "ptr", ServerName, "ptr", EmulatedServerName, "uint")
        return result
    }

    /**
     * The NetServerTransportAdd function binds the server to the transport protocol.
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerTransportAdd</b> function.
     * 
     * If you add a transport protocol to a server using a call to the 
     * <b>NetServerTransportAdd</b> function, the connection will not remain after the server reboots or restarts.
     * @param {Pointer<PWSTR>} servername A pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies information about the transport protocol, including name, address, and location on the network. The <i>bufptr</i> parameter points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that contains the data.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate name exists on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain name could not be found on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid. 
     * 
     * This error is returned if the <b>svti0_transportname</b> or <b>svti0_transportaddress</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a> structure pointed to by the <i>bufptr</i> parameter is <b>NULL</b>. This error is also returned if the <b>svti0_transportaddresslength</b> member in the <b>SERVER_TRANSPORT_INFO_0</b> structure pointed to by the <i>bufptr</i> parameter is zero or larger than MAX_PATH (defined in the Windef.h header file). 
     * 
     * This error is also returned for other invalid parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportadd
     * @since windows5.0
     */
    static NetServerTransportAdd(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetServerTransportAdd", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServerTransportAddEx function binds the specified server to the transport protocol.
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerTransportAddEx</b> function.
     * 
     * If you add a transport protocol to a server using a call to the 
     * <b>NetServerTransportAddEx</b> function, the connection will not remain after the server reboots or restarts.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservercomputernameadd">NetServerComputerNameAdd</a> function is a utility function. It combines the features of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportenum">NetServerTransportEnum</a> function and the 
     * <b>NetServerTransportAddEx</b> function, allowing you to specify an emulated server name.
     * 
     * On Windows Server 2008  and Windows Vista with Service Pack 1 (SP1), every name registered with the Windows remote file server (SRV) is designated as either a scoped name or a non-scoped name.  Every share that is added to the system will then either be attached to all of the non-scoped names, or to a single scoped name.  Applications that wish to use the scoping features are responsible for both registering the new name as a scoped endpoint and then creating the shares with an appropriate scope. In this way, legacy uses of the Network Management and Network Share Management functions are not affected in any way since they continue to register shares and names as non-scoped names.  
     * 
     * A scoped endpoint is created by calling the <b>NetServerTransportAddEx</b> function with the <i>level</i> parameter set to 2 and the <i>bufptr</i> parameter pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti2_flags</b> member. A scoped endpoint is also created by calling the <b>NetServerTransportAddEx</b> function with the <i>level</i> parameter set to 3 and the <i>bufptr</i> parameter pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti3_flags</b> member. 
     * 
     * When the <b>SVTI2_SCOPED_NAME</b> bit value is set for a transport, then shares can be added with a corresponding server name (the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> structure) in a scoped fashion using the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function.  If there is no transport registered with the <b>SVTI2_SCOPED_NAME</b> bit value and the name provided in <b>shi503_servername</b> member, then the share add in a scoped fashion will not succeed.
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function is used to add a scoped share on a remote server specified in the <i>servername</i> parameter. The remote server specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> passed in the <i>bufptr</i> parameter must have been bound to a transport protocol using the <b>NetServerTransportAddEx</b> function as a scoped endpoint. The <b>SVTI2_SCOPED_NAME</b> flag must have been specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure for the transport protocol.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharedelex">NetShareDelEx</a> function is used to delete a scoped share.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> functions are to used to get and set information on a scoped share.  
     * 
     * Scoped endpoints are generally used by the cluster namespace.
     * @param {Pointer<PWSTR>} servername A pointer to a string that specifies the name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that contains the data. The format of this data depends on the value of the <i>level</i> parameter. 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate name exists on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAINNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain name could not be found on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid. 
     * 
     * This error is returned if the transport name or transport address member in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_0">SERVER_TRANSPORT_INFO_0</a>, <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_1">SERVER_TRANSPORT_INFO_1</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_3">SERVER_TRANSPORT_INFO_3</a> structure pointed to by the <i>bufptr</i> parameter is <b>NULL</b>. This error is also returned if the transport address length member in the <b>SERVER_TRANSPORT_INFO_0</b>, <b>SERVER_TRANSPORT_INFO_1</b>, 
     * <b>SERVER_TRANSPORT_INFO_2</b>, or 
     * <b>SERVER_TRANSPORT_INFO_3</b> structure pointed to by the <i>bufptr</i> parameter is zero or larger than MAX_PATH (defined in the <i>Windef.h</i> header file). This error is also returned if the flags member of the <b>SERVER_TRANSPORT_INFO_2</b>, or 
     * <b>SERVER_TRANSPORT_INFO_3</b> structure pointed to by the <i>bufptr</i> parameter contains an illegal value.
     * 
     * This error is also returned for other invalid parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportaddex
     * @since windows5.0
     */
    static NetServerTransportAddEx(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetServerTransportAddEx", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServerTransportDel function unbinds (or disconnects) the transport protocol from the server. Effectively, the server can no longer communicate with clients using the specified transport protocol (such as TCP or XNS).
     * @remarks
     * Only members of the Administrators or Server Operators local group can successfully execute the 
     * <b>NetServerTransportDel</b> function.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NetNameNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The share name does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportdel
     * @since windows5.0
     */
    static NetServerTransportDel(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetServerTransportDel", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServerTransportEnum function supplies information about transport protocols that are managed by the server.
     * @remarks
     * Only Authenticated Users can successfully call this function.<b>Windows XP/2000:  </b>No special group membership is required to successfully execute this function.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} resume_handle Pointer to a value that contains a resume handle which is used to continue an existing server transport search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for the <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BufTooSmall</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-netservertransportenum
     * @since windows5.0
     */
    static NetServerTransportEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetServerTransportEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetServiceControl function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} service 
     * @param {Integer} opcode 
     * @param {Integer} arg 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netservicecontrol
     */
    static NetServiceControl(servername, service, opcode, arg, bufptr) {
        result := DllCall("NETAPI32.dll\NetServiceControl", "ptr", servername, "ptr", service, "uint", opcode, "uint", arg, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServiceEnum function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
     * @param {Pointer<PWSTR>} servername 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @param {Integer} prefmaxlen 
     * @param {Pointer<UInt32>} entriesread 
     * @param {Pointer<UInt32>} totalentries 
     * @param {Pointer<UInt32>} resume_handle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netserviceenum
     */
    static NetServiceEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetServiceEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetServiceGetInfo function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} service 
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netservicegetinfo
     */
    static NetServiceGetInfo(servername, service, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetServiceGetInfo", "ptr", servername, "ptr", service, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetServiceInstall function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
     * @param {Pointer<PWSTR>} servername 
     * @param {Pointer<PWSTR>} service 
     * @param {Integer} argc 
     * @param {Pointer<PWSTR>} argv 
     * @param {Pointer<Byte>} bufptr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netserviceinstall
     */
    static NetServiceInstall(servername, service, argc, argv, bufptr) {
        result := DllCall("NETAPI32.dll\NetServiceInstall", "ptr", servername, "ptr", service, "uint", argc, "ptr", argv, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetUseAdd function establishes a connection between the local computer and a remote server.
     * @remarks
     * You can also use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection3a">WNetAddConnection3</a> functions to redirect a local device to a network resource.
     * 
     * No special group membership is required to call the 
     * <b>NetUseAdd</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
     * 
     * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseAdd</b> function does not support Distributed File System (DFS) shares. To add a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection3a">WNetAddConnection3</a> function.
     * 
     * 
     * If the 
     * <b>NetUseAdd</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>ParmError</i> parameter to indicate the first member of the information structure that is invalid. (The information structure begins with USE_INFO_ and its format is specified by the <i>Level</i> parameter.) The following table lists the values that can be returned in the <i>ParmError</i> parameter and the corresponding structure member that is in error. (The prefix ui<i>*</i>_ indicates that the member can begin with multiple prefixes, for example, ui1_ or ui2_.)
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>USE_LOCAL_PARMNUM</td>
     * <td>1</td>
     * <td>ui<i>*</i>_local</td>
     * </tr>
     * <tr>
     * <td>USE_REMOTE_PARMNUM</td>
     * <td>2</td>
     * <td>ui<i>*</i>_remote</td>
     * </tr>
     * <tr>
     * <td>USE_PASSWORD_PARMNUM</td>
     * <td>3</td>
     * <td>ui<i>*</i>_password</td>
     * </tr>
     * <tr>
     * <td>USE_ASGTYPE_PARMNUM</td>
     * <td>4</td>
     * <td>ui<i>*</i>_asg_type</td>
     * </tr>
     * <tr>
     * <td>USE_USERNAME_PARMNUM</td>
     * <td>5</td>
     * <td>ui<i>*</i>_username</td>
     * </tr>
     * <tr>
     * <td>USE_DOMAINNAME_PARMNUM</td>
     * <td>6</td>
     * <td>ui<i>*</i>_domainname</td>
     * </tr>
     * </table>
     * @param {Pointer<SByte>} servername The UNC name of the computer on which to execute this function. If this parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Integer} LevelFlags 
     * @param {Pointer<Byte>} buf A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>Level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err A pointer to a value that receives the index of the first member of the information structure in error when the ERROR_INVALID_PARAMETER error is returned. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netuseadd
     * @since windows5.0
     */
    static NetUseAdd(servername, LevelFlags, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetUseAdd", "ptr", servername, "uint", LevelFlags, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetUseDel function ends a connection to a shared resource.
     * @remarks
     * The <b>NetUseDel</b> function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseDel</b> function does not support Distributed File System (DFS) shares or other network file systems. To terminate a connection to a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetcancelconnection2a">WNetCancelConnection2</a> function.
     * 
     * 
     * No special group membership is required to call the 
     * <b>NetUseDel</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
     * @param {Pointer<PWSTR>} UncServerName The UNC name of the computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. 
     * 
     * If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Pointer<PWSTR>} UseName A pointer to a string that specifies the path of the connection to delete.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Integer} ForceLevelFlags The level of force to use in deleting the connection.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netusedel
     * @since windows5.0
     */
    static NetUseDel(UncServerName, UseName, ForceLevelFlags) {
        result := DllCall("NETAPI32.dll\NetUseDel", "ptr", UncServerName, "ptr", UseName, "uint", ForceLevelFlags, "uint")
        return result
    }

    /**
     * The NetUseEnum function lists all current connections between the local computer and resources on remote servers.
     * @remarks
     * No special group membership is required to call the 
     * <b>NetUseEnum</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility using the legacy Remote Access Protocol.
     * 
     * To retrieve information about one network connection, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netusegetinfo">NetUseGetInfo</a> function.
     * 
     * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseEnum</b> function does not support Distributed File System (DFS) shares. To enumerate shares using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetopenenuma">WNetOpenEnum</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetcloseenum">WNetCloseEnum</a> functions.
     * @param {Pointer<PWSTR>} UncServerName The UNC name of the computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism.  
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Integer} LevelFlags 
     * @param {Pointer<Byte>} BufPtr A pointer to the buffer that receives the information structures. The format of this data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when the information is no longer needed. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b>.
     * @param {Integer} PreferedMaximumSize The preferred maximum length, in bytes, of the data to return. If <b>MAX_PREFERRED_LENGTH</b> is specified, the function allocates the amount of memory required for the data. If another value is specified in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} EntriesRead A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} TotalEntries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} ResumeHandle A pointer to a value that contains a resume handle which is used to continue the search. The handle should be zero on the first call and left unchanged for subsequent calls. If <i>ResumeHandle</i> is <b>NULL</b>, then no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>BufPtr</i> or <i>entriesread</i> parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more data to return. This error is returned if the buffer size is insufficient to hold all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the  <i>UncServerName</i> parameter was not <b>NULL</b> and the remote server does not support remote RPC calls using the legacy Remote Access Protocol mechanism. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netuseenum
     * @since windows5.0
     */
    static NetUseEnum(UncServerName, LevelFlags, BufPtr, PreferedMaximumSize, EntriesRead, TotalEntries, ResumeHandle) {
        result := DllCall("NETAPI32.dll\NetUseEnum", "ptr", UncServerName, "uint", LevelFlags, "ptr", BufPtr, "uint", PreferedMaximumSize, "ptr", EntriesRead, "ptr", TotalEntries, "ptr", ResumeHandle, "uint")
        return result
    }

    /**
     * The NetUseGetInfo function retrieves information about a connection to a shared resource.
     * @remarks
     * No special group membership is required to call the 
     * <b>NetUseGetInfo</b> function. This function cannot be executed on a remote server except in cases of downlevel compatibility.
     * 
     * To list all current connections between the local computer and resources on remote servers, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseenum">NetUseEnum</a> function.
     * 
     * This function applies only to the Server Message Block (LAN Manager Workstation) client. The <b>NetUseGetInfo</b> function does not support Distributed File System (DFS) shares. To retrieve information for a share using a different network provider (WebDAV or a DFS share, for example), use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetconnectiona">WNetGetConnection</a> function.
     * @param {Pointer<PWSTR>} UncServerName The UNC name of computer on which to execute this function. If this is parameter is <b>NULL</b>, then the local computer is used. If the <i>UncServerName</i> parameter specified is a remote computer, then the remote computer must support remote RPC calls using the legacy Remote Access Protocol mechanism. 
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Pointer<PWSTR>} UseName A pointer to a string that specifies the name of the connection for which to return information.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @param {Integer} LevelFlags 
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmuse/nf-lmuse-netusegetinfo
     * @since windows5.0
     */
    static NetUseGetInfo(UncServerName, UseName, LevelFlags, bufptr) {
        result := DllCall("NETAPI32.dll\NetUseGetInfo", "ptr", UncServerName, "ptr", UseName, "uint", LevelFlags, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetWkstaGetInfo function returns information about the configuration of a workstation.
     * @remarks
     * <b>Windows Server 2003 and Windows XP:  </b> If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the securable object. To enable anonymous access, the user Anonymous must be a member of the "Pre-Windows 2000 compatible access" group. This is because anonymous tokens do not include the Everyone group SID by default. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the EveryoneIncludesAnonymous policy setting allows anonymous access. Anonymous access is always permitted for level 100. If you call this function at level 101, authenticated users can view the information. Members of the Administrators, and the Server, System and Print Operator local groups can view information at levels 102 and 502. For more information about restricting anonymous access, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * <b>Windows 2000:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits all authenticated users and members of the "
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. By default, the "Pre-Windows 2000 compatible access" group includes Everyone as a member. This enables anonymous access to the information if the system allows anonymous access. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting allows anonymous access.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information,see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstagetinfo
     * @since windows5.0
     */
    static NetWkstaGetInfo(servername, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetWkstaGetInfo", "ptr", servername, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetWkstaSetInfo function configures a workstation with information that remains in effect after the system has been reinitialized.
     * @remarks
     * Only members of the Administrators group can successfully execute the 
     * <b>NetWkstaSetInfo</b> function on a remote server.
     * 
     * The
     * 				<b>NetWkstaSetInfo</b> function calls the workstation service on the local system or a remote system. Only a limited number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_info_502">WKSTA_INFO_502</a> structure can actually be changed using the <b>NetWkstaSetInfo</b> function. No errors are returned if a member is set that is ignored by the workstation service. The workstation service is primarily configured using settings in the registry. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/nf-lmwksta-netwkstausersetinfo">NetWkstaUserSetInfo</a> function can be used instead of the <b>NetWkstaSetInfo</b> function to set configuration information on the local system. The <b>NetWkstaUserSetInfo</b> function calls the Local Security Authority (LSA). 
     * 
     * If the 
     * <b>NetWkstaSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the first member of the workstation information structure that is invalid. (A workstation information structure begins with WKSTA_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix wki*_ indicates that the member can begin with multiple prefixes, for example, wki100_ or wki402_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>WKSTA_PLATFORM_ID_PARMNUM</td>
     * <td>wki*_platform_id</td>
     * </tr>
     * <tr>
     * <td>WKSTA_COMPUTERNAME_PARMNUM</td>
     * <td>wki*_computername</td>
     * </tr>
     * <tr>
     * <td>WKSTA_LANGROUP_PARMNUM</td>
     * <td>wki*_langroup</td>
     * </tr>
     * <tr>
     * <td>WKSTA_VER_MAJOR_PARMNUM</td>
     * <td>wki*_ver_major</td>
     * </tr>
     * <tr>
     * <td>WKSTA_VER_MINOR_PARMNUM</td>
     * <td>wki*_ver_minor</td>
     * </tr>
     * <tr>
     * <td>WKSTA_LOGGED_ON_USERS_PARMNUM</td>
     * <td>wki*_logged_on_users</td>
     * </tr>
     * <tr>
     * <td>WKSTA_LANROOT_PARMNUM</td>
     * <td>wki*_lanroot</td>
     * </tr>
     * <tr>
     * <td>WKSTA_LOGON_DOMAIN_PARMNUM</td>
     * <td>wki*_logon_domain</td>
     * </tr>
     * <tr>
     * <td>WKSTA_LOGON_SERVER_PARMNUM</td>
     * <td>wki*_logon_server</td>
     * </tr>
     * <tr>
     * <td>WKSTA_CHARWAIT_PARMNUM</td>
     * <td>wki*_char_wait</td>
     * </tr>
     * <tr>
     * <td>WKSTA_CHARTIME_PARMNUM</td>
     * <td>wki*_collection_time</td>
     * </tr>
     * <tr>
     * <td>WKSTA_CHARCOUNT_PARMNUM</td>
     * <td>wki*_maximum_collection_count</td>
     * </tr>
     * <tr>
     * <td>WKSTA_KEEPCONN_PARMNUM</td>
     * <td>wki*_keep_conn</td>
     * </tr>
     * <tr>
     * <td>WKSTA_KEEPSEARCH_PARMNUM</td>
     * <td>wki*_keep_search</td>
     * </tr>
     * <tr>
     * <td>WKSTA_MAXCMDS_PARMNUM</td>
     * <td>wki*_max_cmds</td>
     * </tr>
     * <tr>
     * <td>WKSTA_NUMWORKBUF_PARMNUM</td>
     * <td>wki*_num_work_buf</td>
     * </tr>
     * <tr>
     * <td>WKSTA_MAXWRKCACHE_PARMNUM</td>
     * <td>wki*_max_wrk_cache</td>
     * </tr>
     * <tr>
     * <td>WKSTA_SESSTIMEOUT_PARMNUM</td>
     * <td>wki*_sess_timeout</td>
     * </tr>
     * <tr>
     * <td>WKSTA_SIZERROR_PARMNUM</td>
     * <td>wki*_siz_error</td>
     * </tr>
     * <tr>
     * <td>WKSTA_NUMALERTS_PARMNUM</td>
     * <td>wki*_num_alerts</td>
     * </tr>
     * <tr>
     * <td>WKSTA_NUMSERVICES_PARMNUM</td>
     * <td>wki*_num_services</td>
     * </tr>
     * <tr>
     * <td>WKSTA_ERRLOGSZ_PARMNUM</td>
     * <td>wki*_errlog_sz</td>
     * </tr>
     * <tr>
     * <td>WKSTA_PRINTBUFTIME_PARMNUM</td>
     * <td>wki*_print_buf_time</td>
     * </tr>
     * <tr>
     * <td>WKSTA_NUMCHARBUF_PARMNU</td>
     * <td>wki*_num_char_buf</td>
     * </tr>
     * <tr>
     * <td>WKSTA_SIZCHARBUF_PARMNUM</td>
     * <td>wki*_siz_char_buf</td>
     * </tr>
     * <tr>
     * <td>WKSTA_WRKHEURISTICS_PARMNUM</td>
     * <td>wki*_wrk_heuristics</td>
     * </tr>
     * <tr>
     * <td>WKSTA_MAILSLOTS_PARMNUM</td>
     * <td>wki*_mailslots</td>
     * </tr>
     * <tr>
     * <td>WKSTA_MAXTHREADS_PARMNUM</td>
     * <td>wki*_max_threads</td>
     * </tr>
     * <tr>
     * <td>WKSTA_SIZWORKBUF_PARMNUM</td>
     * <td>wki*_siz_work_buf</td>
     * </tr>
     * <tr>
     * <td>WKSTA_NUMDGRAMBUF_PARMNUM</td>
     * <td>wki*_num_dgram_buf</td>
     * </tr>
     * </table>
     *  
     * 
     * The workstation service parameter settings are stored in the registry, not in the LanMan.ini file used previously by LAN Manager. The 
     * <b>NetWkstaSetInfo</b> function does not change the values in the LanMan.ini file. When the workstation service is stopped and restarted, workstation parameters are reset to the default values specified in the registry (unless they are overwritten by command-line parameters). Values set by previous calls to 
     * <b>NetWkstaSetInfo</b> can be overwritten when workstation parameters are reset.
     * @param {Pointer<PWSTR>} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buffer A pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err A pointer to a value that receives the index of the first member of the workstation information structure that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error. For more information, see the Remarks section.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstasetinfo
     * @since windows5.0
     */
    static NetWkstaSetInfo(servername, level, buffer, parm_err) {
        result := DllCall("NETAPI32.dll\NetWkstaSetInfo", "ptr", servername, "uint", level, "ptr", buffer, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetWkstaUserGetInfo function returns information about the currently logged-on user. This function must be called in the context of the logged-on user.
     * @remarks
     * The 
     * <b>NetWkstaUserGetInfo</b> function only works locally.
     * @param {Pointer<PWSTR>} reserved This parameter must be set to <b>NULL</b>.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>bufptr</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system ran out of memory resources. Either the network manager configuration is incorrect, or the program is running on a system with insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstausergetinfo
     * @since windows5.0
     */
    static NetWkstaUserGetInfo(reserved, level, bufptr) {
        result := DllCall("NETAPI32.dll\NetWkstaUserGetInfo", "ptr", reserved, "uint", level, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetWkstaUserSetInfo function sets the user-specific information about the configuration elements for a workstation.
     * @remarks
     * The 
     * <b>NetWkstaUserSetInfo</b> function only works locally. Administrator group membership is required.
     * 
     * Domain names in the <b>wkui1101_oth_domains</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_user_info_1101">WKSTA_USER_INFO_1101</a> structure are separated by spaces. An empty list is valid. A <b>NULL</b> pointer means to leave the member unmodified. The <b>wkui1101_oth_domains</b> member cannot be set with MS-DOS. When setting this element, 
     * <b>NetWkstaUserSetInfo</b> rejects the request if the name list was invalid or if a name could not be added to one or more of the network adapters managed by the system.
     * 
     * If the 
     * <b>NetWkstaUserSetInfo</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the member of the workstation user information structure that is invalid. (A workstation user information structure begins with WKSTA_USER_INFO_ and its format is specified by the <i>level</i> parameter.) The following table lists the value that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error. (The prefix wkui*_ indicates that the member can begin with multiple prefixes, for example, wkui0_ or wkui1_.)
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>WKSTA_OTH_DOMAINS_PARMNUM</td>
     * <td>wkui*_oth_domains</td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} reserved This parameter must be set to zero.
     * @param {Integer} level 
     * @param {Pointer<Byte>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first parameter that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstausersetinfo
     * @since windows5.0
     */
    static NetWkstaUserSetInfo(reserved, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetWkstaUserSetInfo", "ptr", reserved, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * The NetWkstaUserEnum function lists information about all users currently logged on to the workstation. This list includes interactive, service and batch logons.
     * @remarks
     * Note that since the 
     * <b>NetWkstaUserEnum</b> function lists entries for service and batch logons, as well as for interactive logons, the function can return entries for users who have logged off a workstation. This can occur, for example, when a user calls a service that impersonates the user. In this instance, 
     * <b>NetWkstaUserEnum</b> returns an entry for the user until the service stops impersonating the user.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the ACL for the securable object. To enable anonymous access, the user Anonymous must be a member of the "Pre-Windows 2000 compatible access" group. This is because anonymous tokens do not include the Everyone group SID by default. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting permits anonymous access. If the RestrictAnonymous policy setting does not permit anonymous access, only an administrator can successfully execute the function. Members of the Administrators, and the Server, System and Print Operator local groups can also view information. For more information about restricting anonymous access, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/security-requirements-for-the-network-management-functions">Security Requirements for the Network Management Functions</a>. For more information on ACLs, ACEs, and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>.
     * 
     * <b>Windows 2000:  </b>If you call this function on a domain controller that is running Active Directory, access is allowed or denied based on the access control list (ACL) for the securable object. The default ACL permits all authenticated users and members of the "
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/allowing-anonymous-access">Pre-Windows 2000 compatible access</a>" group to view the information. By default, the "Pre-Windows 2000 compatible access" group includes Everyone as a member. This enables anonymous access to the information if the system allows anonymous access. If you call this function on a member server or workstation, all authenticated users can view the information. Anonymous access is also permitted if the RestrictAnonymous policy setting allows anonymous access.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information,see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level 
     * @param {Pointer<Byte>} bufptr Pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} prefmaxlen Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread Pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} resumehandle Pointer to a value that contains a resume handle which is used to continue an existing search. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>level</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstauserenum
     * @since windows5.0
     */
    static NetWkstaUserEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle) {
        result := DllCall("NETAPI32.dll\NetWkstaUserEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resumehandle, "uint")
        return result
    }

    /**
     * Not supported. (NetWkstaTransportAdd)
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetWkstaTransportAdd</b> function.
     * 
     * If the 
     * <b>NetWkstaTransportAdd</b> function returns ERROR_INVALID_PARAMETER, you can use the <i>parm_err</i> parameter to indicate the member of the 
     * <b>WKSTA_TRANSPORT_INFO_0</b> structure that is invalid. The following table lists the values that can be returned in the <i>parm_err</i> parameter and the corresponding structure member that is in error.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Member</th>
     * </tr>
     * <tr>
     * <td>TRANSPORT_QUALITYOFSERVICE_PARMNUM</td>
     * <td><b>wkti0_quality_of_service</b></td>
     * </tr>
     * <tr>
     * <td>TRANSPORT_NAME_PARMNUM</td>
     * <td><b>wkti0_transport_name</b></td>
     * </tr>
     * </table>
     * @param {Pointer<SByte>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
     * 
     * 
     * This string must begin with \\.
     * @param {Integer} level Specifies the information level of the data. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies workstation transport protocol information. The <i>buf</i> parameter points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_transport_info_0">WKSTA_TRANSPORT_INFO_0</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} buf Pointer to the buffer that specifies the data. The format of this data depends on the value of the <i>level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} parm_err Pointer to a value that receives the index of the first parameter that causes the ERROR_INVALID_PARAMETER error. If this parameter is <b>NULL</b>, the index is not returned on error.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The level parameter, which indicates what level of data structure information is available, is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportadd
     */
    static NetWkstaTransportAdd(servername, level, buf, parm_err) {
        result := DllCall("NETAPI32.dll\NetWkstaTransportAdd", "ptr", servername, "uint", level, "ptr", buf, "ptr", parm_err, "uint")
        return result
    }

    /**
     * Not supported. (NetWkstaTransportDel)
     * @remarks
     * Only members of the Administrators local group can successfully execute the 
     * <b>NetWkstaTransportDel</b> function.
     * @param {Pointer<PWSTR>} servername Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used. 
     * 
     * 
     * This string must begin with \\.
     * @param {Pointer<PWSTR>} transportname Pointer to a string that specifies the name of the transport protocol to disconnect from the redirector.
     * @param {Integer} ucond 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the function parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UseNotFound</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportdel
     */
    static NetWkstaTransportDel(servername, transportname, ucond) {
        result := DllCall("NETAPI32.dll\NetWkstaTransportDel", "ptr", servername, "ptr", transportname, "uint", ucond, "uint")
        return result
    }

    /**
     * The NetWkstaTransportEnum function supplies information about transport protocols that are managed by the redirector, which is the software on the client computer that generates file requests to the server computer.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetWkstaTransportEnum</b> function.
     * @param {Pointer<SByte>} servername A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} level The level of information requested for the data. This parameter can be the following value. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return workstation transport protocol information. The <i>bufptr</i> parameter points to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/ns-lmwksta-wksta_transport_info_0">WKSTA_TRANSPORT_INFO_0</a> structures.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} bufptr A pointer to the buffer that receives the data. The format of this data depends on the value of the <i>level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with <b>ERROR_MORE_DATA</b> or <b>NERR_BufTooSmall</b>.
     * @param {Integer} prefmaxlen The preferred maximum length of returned data, in bytes. If you specify <b>MAX_PREFERRED_LENGTH</b>, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns <b>ERROR_MORE_DATA</b> or <b>NERR_BufTooSmall</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} entriesread A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} totalentries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} resume_handle A pointer to a value that contains a resume handle which is used to continue an existing workstation transport search. The handle should be zero on the first call and left unchanged for subsequent calls. If the <i>resumehandle</i> parameter is a <b>NULL</b> pointer, no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The level parameter, which indicates what level of data structure information is available, is invalid. This error is returned if the <i>level</i> parameter is specified as a value other than zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters was invalid. This error is returned if the <i>bufptr</i> or the <i>entriesread</i> parameters are <b>NULL</b> pointers. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory was available to process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if a remote server was specified in <i>servername</i> parameter, and this request is not supported on the remote server. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BufTooSmall</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available. Specify a large enough buffer to receive all entries. This error code is defined in the <i>Lmerr.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmwksta/nf-lmwksta-netwkstatransportenum
     * @since windows5.0
     */
    static NetWkstaTransportEnum(servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle) {
        result := DllCall("NETAPI32.dll\NetWkstaTransportEnum", "ptr", servername, "uint", level, "ptr", bufptr, "uint", prefmaxlen, "ptr", entriesread, "ptr", totalentries, "ptr", resume_handle, "uint")
        return result
    }

    /**
     * The NetApiBufferAllocate function allocates memory from the heap. Use this function only when compatibility with the NetApiBufferFree function is required. Otherwise, use the memory management functions.
     * @remarks
     * No special group membership is required to successfully execute the ApiBuffer functions.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Integer} ByteCount Number of bytes to be allocated.
     * @param {Pointer<Void>} Buffer Receives a pointer to the allocated buffer.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferallocate
     * @since windows5.0
     */
    static NetApiBufferAllocate(ByteCount, Buffer) {
        result := DllCall("NETAPI32.dll\NetApiBufferAllocate", "uint", ByteCount, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The NetApiBufferFree function frees the memory that the NetApiBufferAllocate function allocates. Applications should also call NetApiBufferFree to free the memory that other network management functions use internally to return information.
     * @remarks
     * The
     * 				<b>NetApiBufferFree</b> function is used to free memory used by network management functions. This function is used in two cases:
     * 
     * 
     * <ul>
     * <li> To free memory explicitly allocated by calls in an application to the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function when the memory is no longer needed.</li>
     * <li>To free memory allocated internally by calls in an application to remotable network management functions that return information to the caller. The RPC run-time library internally allocates the buffer containing the return information. </li>
     * </ul>
     * 
     * 
     * Many network management functions retrieve information and return this information as a buffer that may contain a complex structure, an array of structures, or an array of nested structures. These functions use the RPC run-time library to internally allocate the buffer containing the return information, whether the call is to a local computer or a remote server. For example, the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netserverenum">NetServerEnum</a> function retrieves a lists of servers and returns this information as an array of  structures pointed to by the <i>bufptr</i> parameter. When the function is successful, memory is allocated internally by the  <b>NetServerEnum</b> function to store the array of structures returned in the <i>bufptr</i> parameter to the application. When this array of structures is no longer needed,  the <b>NetApiBufferFree</b> function should be called by the application with the <i>Buffer</i> parameter set to the <i>bufptr</i> parameter returned by  <b>NetServerEnum</b> to free this internal memory used. In these cases, the <b>NetApiBufferFree</b> function frees all of the internal memory allocated for the buffer including memory for nested structures, pointers to strings, and other data.
     * 
     * No special group membership is required to successfully execute the <b>NetApiBufferFree</b> function or any of the other <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>.
     * 
     * For a code sample that demonstrates how to use of the <b>NetApiBufferFree</b> function to free memory explicitly allocated by an application, see 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
     * 
     * For a code sample that demonstrates how to use of the <b>NetApiBufferFree</b> function to free memory internally allocated by a network management function to return information, see 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netserverenum">NetServerEnum</a> function.
     * @param {Pointer<Void>} Buffer A pointer to a buffer returned previously by another network management function or memory allocated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferfree
     * @since windows5.0
     */
    static NetApiBufferFree(Buffer) {
        result := DllCall("NETAPI32.dll\NetApiBufferFree", "ptr", Buffer, "uint")
        return result
    }

    /**
     * The NetApiBufferReallocate function changes the size of a buffer allocated by a previous call to the NetApiBufferAllocate function.
     * @remarks
     * No special group membership is required to successfully execute the ApiBuffer functions.
     * 
     * For a code sample that demonstrates how to use the network management 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a>.
     * @param {Pointer<Void>} OldBuffer Pointer to the buffer returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
     * @param {Integer} NewByteCount Specifies the new size of the buffer, in bytes.
     * @param {Pointer<Void>} NewBuffer Receives the pointer to the reallocated buffer.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibufferreallocate
     * @since windows5.0
     */
    static NetApiBufferReallocate(OldBuffer, NewByteCount, NewBuffer) {
        result := DllCall("NETAPI32.dll\NetApiBufferReallocate", "ptr", OldBuffer, "uint", NewByteCount, "ptr", NewBuffer, "uint")
        return result
    }

    /**
     * The NetApiBufferSize function returns the size, in bytes, of a buffer allocated by a call to the NetApiBufferAllocate function.
     * @remarks
     * No special group membership is required to successfully execute the ApiBuffer functions.
     * 
     * For a code sample that demonstrates how to use the network management 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/apibuffer-functions">ApiBuffer functions</a>, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a>.
     * @param {Pointer<Void>} Buffer Pointer to a buffer returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferallocate">NetApiBufferAllocate</a> function.
     * @param {Pointer<UInt32>} ByteCount Receives the size of the buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmapibuf/nf-lmapibuf-netapibuffersize
     * @since windows5.0
     */
    static NetApiBufferSize(Buffer, ByteCount) {
        result := DllCall("NETAPI32.dll\NetApiBufferSize", "ptr", Buffer, "ptr", ByteCount, "uint")
        return result
    }

    /**
     * The NetErrorLogClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Pointer<PWSTR>} UncServerName TBD
     * @param {Pointer<PWSTR>} BackupFile TBD
     * @param {Pointer<Byte>} Reserved TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogclear
     */
    static NetErrorLogClear(UncServerName, BackupFile, Reserved) {
        result := DllCall("NETAPI32.dll\NetErrorLogClear", "ptr", UncServerName, "ptr", BackupFile, "ptr", Reserved, "uint")
        return result
    }

    /**
     * The NetErrorLogRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Pointer<PWSTR>} UncServerName TBD
     * @param {Pointer<PWSTR>} Reserved1 TBD
     * @param {Pointer<HLOG>} ErrorLogHandle TBD
     * @param {Integer} Offset TBD
     * @param {Pointer<UInt32>} Reserved2 TBD
     * @param {Integer} Reserved3 TBD
     * @param {Integer} OffsetFlag TBD
     * @param {Pointer<Byte>} BufPtr TBD
     * @param {Integer} PrefMaxSize TBD
     * @param {Pointer<UInt32>} BytesRead TBD
     * @param {Pointer<UInt32>} TotalAvailable TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogread
     */
    static NetErrorLogRead(UncServerName, Reserved1, ErrorLogHandle, Offset, Reserved2, Reserved3, OffsetFlag, BufPtr, PrefMaxSize, BytesRead, TotalAvailable) {
        result := DllCall("NETAPI32.dll\NetErrorLogRead", "ptr", UncServerName, "ptr", Reserved1, "ptr", ErrorLogHandle, "uint", Offset, "ptr", Reserved2, "uint", Reserved3, "uint", OffsetFlag, "ptr", BufPtr, "uint", PrefMaxSize, "ptr", BytesRead, "ptr", TotalAvailable, "uint")
        return result
    }

    /**
     * The NetErrorLogWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Pointer<Byte>} Reserved1 TBD
     * @param {Integer} Code TBD
     * @param {Pointer<PWSTR>} Component TBD
     * @param {Pointer<Byte>} Buffer TBD
     * @param {Integer} NumBytes TBD
     * @param {Pointer<Byte>} MsgBuf TBD
     * @param {Integer} StrCount TBD
     * @param {Pointer<Byte>} Reserved2 TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmerrlog/nf-lmerrlog-neterrorlogwrite
     */
    static NetErrorLogWrite(Reserved1, Code, Component, Buffer, NumBytes, MsgBuf, StrCount, Reserved2) {
        result := DllCall("NETAPI32.dll\NetErrorLogWrite", "ptr", Reserved1, "uint", Code, "ptr", Component, "ptr", Buffer, "uint", NumBytes, "ptr", MsgBuf, "uint", StrCount, "ptr", Reserved2, "uint")
        return result
    }

    /**
     * The NetConfigGet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
     * @param {Pointer<PWSTR>} server TBD
     * @param {Pointer<PWSTR>} component TBD
     * @param {Pointer<PWSTR>} parameter TBD
     * @param {Pointer<Byte>} bufptr TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfigget
     */
    static NetConfigGet(server, component, parameter, bufptr) {
        result := DllCall("NETAPI32.dll\NetConfigGet", "ptr", server, "ptr", component, "ptr", parameter, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetConfigGetAll function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
     * @param {Pointer<PWSTR>} server TBD
     * @param {Pointer<PWSTR>} component TBD
     * @param {Pointer<Byte>} bufptr TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfiggetall
     */
    static NetConfigGetAll(server, component, bufptr) {
        result := DllCall("NETAPI32.dll\NetConfigGetAll", "ptr", server, "ptr", component, "ptr", bufptr, "uint")
        return result
    }

    /**
     * The NetConfigSet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
     * @param {Pointer<PWSTR>} server TBD
     * @param {Pointer<PWSTR>} reserved1 TBD
     * @param {Pointer<PWSTR>} component TBD
     * @param {Integer} level TBD
     * @param {Integer} reserved2 TBD
     * @param {Pointer<Byte>} buf TBD
     * @param {Integer} reserved3 TBD
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/lmconfig/nf-lmconfig-netconfigset
     */
    static NetConfigSet(server, reserved1, component, level, reserved2, buf, reserved3) {
        result := DllCall("NETAPI32.dll\NetConfigSet", "ptr", server, "ptr", reserved1, "ptr", component, "uint", level, "uint", reserved2, "ptr", buf, "uint", reserved3, "uint")
        return result
    }

    /**
     * The NetAuditClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Pointer<PWSTR>} server 
     * @param {Pointer<PWSTR>} backupfile 
     * @param {Pointer<PWSTR>} service 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditclear
     */
    static NetAuditClear(server, backupfile, service) {
        result := DllCall("NETAPI32.dll\NetAuditClear", "ptr", server, "ptr", backupfile, "ptr", service, "uint")
        return result
    }

    /**
     * The NetAuditRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Pointer<PWSTR>} server 
     * @param {Pointer<PWSTR>} service 
     * @param {Pointer<HLOG>} auditloghandle 
     * @param {Integer} offset 
     * @param {Pointer<UInt32>} reserved1 
     * @param {Integer} reserved2 
     * @param {Integer} offsetflag 
     * @param {Pointer<Byte>} bufptr 
     * @param {Integer} prefmaxlen 
     * @param {Pointer<UInt32>} bytesread 
     * @param {Pointer<UInt32>} totalavailable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditread
     */
    static NetAuditRead(server, service, auditloghandle, offset, reserved1, reserved2, offsetflag, bufptr, prefmaxlen, bytesread, totalavailable) {
        result := DllCall("NETAPI32.dll\NetAuditRead", "ptr", server, "ptr", service, "ptr", auditloghandle, "uint", offset, "ptr", reserved1, "uint", reserved2, "uint", offsetflag, "ptr", bufptr, "uint", prefmaxlen, "ptr", bytesread, "ptr", totalavailable, "uint")
        return result
    }

    /**
     * The NetAuditWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
     * @param {Integer} type 
     * @param {Pointer<Byte>} buf 
     * @param {Integer} numbytes 
     * @param {Pointer<PWSTR>} service 
     * @param {Pointer<Byte>} reserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMgmt/netauditwrite
     */
    static NetAuditWrite(type, buf, numbytes, service, reserved) {
        result := DllCall("NETAPI32.dll\NetAuditWrite", "uint", type, "ptr", buf, "uint", numbytes, "ptr", service, "ptr", reserved, "uint")
        return result
    }

    /**
     * The NetJoinDomain function joins a computer to a workgroup or domain.
     * @remarks
     * Joining (and unjoining) a computer to a domain or workgroup can be performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
     * 
     * If you call the 
     * <b>NetJoinDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
     * 
     * Different processes, or different threads of the same process, should not call the 
     * <b>NetJoinDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
     * 
     * If you encounter a problem during a join operation, you should not delete a computer account and immediately follow the deletion with another join attempt. This can lead to replication-related problems that are difficult to investigate. When you delete a computer account, wait until the change has replicated to all domain controllers before attempting another join operation.
     * 
     * A system reboot is required after calling the <b>NetJoinDomain</b> function for the operation to complete.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>When a call to the 
     * <b>NetJoinDomain</b> function precedes a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrenamemachineindomain">NetRenameMachineInDomain</a> function, you should defer the update of the SPN and DnsHostName properties on the computer object until the rename operation. This is because the join operation can fail in certain situations. An example of such a situation is when the SPN that is derived from the current computer name is not valid in the new domain that the computer is joining, but the SPN derived from the new name that the computer will have after the rename operation is valid in the new domain. In this situation, the call to 
     * <b>NetJoinDomain</b> fails unless you defer the update of the two properties until the rename operation by specifying the NETSETUP_DEFER_SPN_SET flag in the <i>fJoinOptions</i> parameter when you call 
     * <b>NetJoinDomain</b>.
     * @param {Pointer<PWSTR>} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to execute the domain join operation. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpDomain A pointer to a constant null-terminated character string that specifies the name of the domain or workgroup to join. 
     * 
     * 
     * 
     * 
     * Optionally, you can specify the preferred domain controller to perform the join operation. In this instance, the string must be of the form  <i>DomainName\MachineName</i>,  where <i>DomainName</i>  is the name of the domain to join, and <i>MachineName</i> is the name of the domain controller to perform the join.
     * @param {Pointer<PWSTR>} lpMachineAccountOU Optionally specifies the pointer to a constant null-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) for the computer account. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpAccount A pointer to a constant null-terminated character string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, <i>REDMOND\user</i>) or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
     * @param {Pointer<PWSTR>} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * You can specify a local machine account password rather than a user password for unsecured joins. For more information, see the description of the NETSETUP_MACHINE_PWD_PASSED flag described in the <i>fJoinOptions</i> parameter.
     * @param {Integer} fJoinOptions 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>lpDomain</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain did not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the computer specified in the <i>lpServer</i> parameter does not support  some of the options passed in the <i>fJoinOptions</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidWorkgroupName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified workgroup name is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SetupAlreadyJoined</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is already joined to a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netjoindomain
     * @since windows5.0
     */
    static NetJoinDomain(lpServer, lpDomain, lpMachineAccountOU, lpAccount, lpPassword, fJoinOptions) {
        result := DllCall("NETAPI32.dll\NetJoinDomain", "ptr", lpServer, "ptr", lpDomain, "ptr", lpMachineAccountOU, "ptr", lpAccount, "ptr", lpPassword, "uint", fJoinOptions, "uint")
        return result
    }

    /**
     * The NetUnjoinDomain function unjoins a computer from a workgroup or a domain.
     * @remarks
     * Unjoining (and joining) a computer to a domain or workgroup can be performed only by a member of the Administrators local group on the target computer. If you call the 
     * <b>NetUnjoinDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
     * 
     * Different processes, or different threads of the same process, should not call the 
     * <b>NetUnjoinDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
     * 
     * A system reboot is required after calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrenamemachineindomain">NetRenameMachineInDomain</a> function for the operation to complete.
     * @param {Pointer<PWSTR>} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpAccount A pointer to a constant string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, <i>REDMOND\user</i>) or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
     * @param {Pointer<PWSTR>} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Integer} fUnjoinOptions Specifies the unjoin options. If this parameter is NETSETUP_ACCT_DELETE, the account is disabled when the unjoin occurs. Note that this option does not delete the account. Currently, there are no other unjoin options defined.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SetupNotJoined</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is not currently joined to a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SetupDomainController</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This computer is a domain controller and cannot be unjoined from a domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netunjoindomain
     * @since windows5.0
     */
    static NetUnjoinDomain(lpServer, lpAccount, lpPassword, fUnjoinOptions) {
        result := DllCall("NETAPI32.dll\NetUnjoinDomain", "ptr", lpServer, "ptr", lpAccount, "ptr", lpPassword, "uint", fUnjoinOptions, "uint")
        return result
    }

    /**
     * The NetRenameMachineInDomain function changes the name of a computer in a domain.
     * @remarks
     * Renaming a domain computer can be performed only by a user that is a member of the Administrators local group on the target computer and that also is a member of the Administrators group on the domain or has the Account Operator privilege on the domain. If you call the 
     * <b>NetRenameMachineInDomain</b> function remotely, you must supply credentials because you cannot delegate credentials under these circumstances.
     * 
     * Different processes, or different threads of the same process, should not call the 
     * <b>NetRenameMachineInDomain</b> function at the same time. This situation can leave the computer in an inconsistent state.
     * 
     * The <b>NERR_SetupNotJoined</b> and  <b>NERR_SetupDomainController</b> return values are defined in the Lmerr.h header file. This header file is automatically included by the Lm.h header file and should not be included directly.
     * 
     * A system reboot is required after calling the <b>NetRenameMachineInDomain</b> function for the operation to complete.
     * @param {Pointer<PWSTR>} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpNewMachineName A pointer to a constant string that specifies the new name of the computer. If specified, the local computer name is changed as well. If this parameter is <b>NULL</b>, the function assumes you have already called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernameexa">SetComputerNameEx</a> function.
     * @param {Pointer<PWSTR>} lpAccount A pointer to a constant string that specifies an account name to use when connecting to the domain controller. If this parameter is <b>NULL</b>, the caller's context is used.
     * @param {Pointer<PWSTR>} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Integer} fRenameOptions The rename options. If this parameter is NETSETUP_ACCT_CREATE, the function renames the account in the domain.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the account name passed in the <i>lpAccount</i> parameter did not have sufficient access rights for the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SetupNotJoined</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is not currently joined to a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_SetupDomainController</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This computer is a domain controller and cannot be unjoined from a domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrenamemachineindomain
     * @since windows5.0
     */
    static NetRenameMachineInDomain(lpServer, lpNewMachineName, lpAccount, lpPassword, fRenameOptions) {
        result := DllCall("NETAPI32.dll\NetRenameMachineInDomain", "ptr", lpServer, "ptr", lpNewMachineName, "ptr", lpAccount, "ptr", lpPassword, "uint", fRenameOptions, "uint")
        return result
    }

    /**
     * The NetValidateName function verifies that a name is valid for name type specified(computer name, workgroup name, domain name, or DNS computer name).
     * @remarks
     * The
     * 				<b>NetValidateName</b> function validates a name based on the nametype specified. 
     * 
     * If the <i>NameType</i> parameter is <b>NetSetupMachine</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS name and the name must not currently be in use on the network.
     * 
     * If the <i>NameType</i> parameter is <b>NetSetupWorkgroup</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS name, the name must not currently be in use on the network as a unique name, and the name must be different from the computer name.
     * 
     * If the <i>NameType</i> parameter is <b>NetSetupDomain</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS or DNS name and the name must currently be registered as a domain name.
     * 
     * If the <i>NameType</i> parameter is <b>NetSetupNonExistentDomain</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a NetBIOS or DNS name and the name must currently not be registered as a domain name.
     * 
     * If the <i>NameType</i> parameter is <b>NetSetupDnsMachine</b>, the name passed  in the <i>lpName</i> parameter must be syntactically correct as a DNS name.
     * 
     * NetBIOS names are limited to maximum length of 16 characters.
     * 
     * No special group membership is required to successfully execute the 
     * <b>NetValidateName</b> function.
     * @param {Pointer<PWSTR>} lpServer A pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpName A pointer to a constant string that specifies the name to validate. Depending on the value specified in the <i>NameType</i> parameter, the <i>lpName</i>  parameter can point to a computer name, workgroup name, domain name, or DNS computer name.
     * @param {Pointer<PWSTR>} lpAccount If the <i>lpName</i> parameter is a domain name, this parameter points to an account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, "REDMOND\user") or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
     * @param {Pointer<PWSTR>} lpPassword If the <i>lpAccount</i>  parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Integer} NameType The type of the name passed in the <i>lpName</i> parameter to validate. This parameter can be one of the values from the NETSETUP_NAME_TYPE enumeration type defined in the <i>Lmjoin.h</i> header file.
     * 
     * Note that the <i>Lmjoin.h</i> header is automatically included by the <i>Lm.h</i> header file. The <i>Lmjoin.h</i> header files should not be used directly. 
     * 
     * 
     * 
     *  The following list shows the possible values for this parameter. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupUnknown"></a><a id="netsetupunknown"></a><a id="NETSETUPUNKNOWN"></a><dl>
     * <dt><b>NetSetupUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The nametype is unknown. If this value is used, the <b>NetValidateName</b> function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupMachine"></a><a id="netsetupmachine"></a><a id="NETSETUPMACHINE"></a><dl>
     * <dt><b>NetSetupMachine</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify that the NetBIOS computer name is valid and that it is not in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupWorkgroup"></a><a id="netsetupworkgroup"></a><a id="NETSETUPWORKGROUP"></a><dl>
     * <dt><b>NetSetupWorkgroup</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify that the workgroup name is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupDomain"></a><a id="netsetupdomain"></a><a id="NETSETUPDOMAIN"></a><dl>
     * <dt><b>NetSetupDomain</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify that the domain name exists and that it is a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupNonExistentDomain"></a><a id="netsetupnonexistentdomain"></a><a id="NETSETUPNONEXISTENTDOMAIN"></a><dl>
     * <dt><b>NetSetupNonExistentDomain</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify that the domain name is not in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NetSetupDnsMachine"></a><a id="netsetupdnsmachine"></a><a id="NETSETUPDNSMACHINE"></a><dl>
     * <dt><b>NetSetupDnsMachine</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify that the DNS computer name is valid.
     * 
     * This value is supported on Windows 2000 and later. The application must be compiled with <b>_WIN32_WINNT &gt;= 0x0500</b> to use this value.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DNS_ERROR_INVALID_NAME_CHAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS name contains an invalid character. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> and the DNS name in the <i>lpName</i> parameter contains an invalid character. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DNS_ERROR_NON_RFC_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS name does not comply with RFC specifications. This error is returned if the  <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> and the DNS name in the <i>lpName</i> parameter does not comply with RFC specifications. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate name already exists on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_COMPUTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the specified computer name is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the  <i>lpName</i> parameter is <b>NULL</b> or the <i>NameType</i> parameter is specified as <b>NetSetupUnknown</b> or an unknown nametype. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and this call is not supported on the remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer name is not valid. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupDnsMachine</b> or <b>NetSetupMachine</b> and the specified computer name is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidWorkgroupName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified workgroup name is not valid. This error is returned if the <i>NameType</i> parameter specified is <b>NetSetupWorkgroup</b> and the specified workgroup name is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC server is not available. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and the RPC server is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_REMOTE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remote calls are not allowed for this process. This error is returned if a remote computer was specified in the <i>lpServer</i> parameter and remote calls are not allowed for this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netvalidatename
     * @since windows5.0
     */
    static NetValidateName(lpServer, lpName, lpAccount, lpPassword, NameType) {
        result := DllCall("NETAPI32.dll\NetValidateName", "ptr", lpServer, "ptr", lpName, "ptr", lpAccount, "ptr", lpPassword, "int", NameType, "uint")
        return result
    }

    /**
     * The NetGetJoinableOUs function retrieves a list of organizational units (OUs) in which a computer account can be created.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetGetJoinableOUs</b> function.
     * 
     * For more information about organizational units, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/managing-users">Managing Users</a> in the Active Directory documentation.
     * @param {Pointer<PWSTR>} lpServer Pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpDomain Pointer to a constant string that specifies the name of the domain for which to retrieve the list of OUs that can be joined.
     * @param {Pointer<PWSTR>} lpAccount Pointer to a constant string that specifies the account name to use when connecting to the domain controller. The string must specify either a domain NetBIOS name and user account (for example, "REDMOND\user") or the user principal name (UPN) of the user in the form of an Internet-style login name (for example, "someone@example.com"). If this parameter is <b>NULL</b>, the caller's context is used.
     * @param {Pointer<PWSTR>} lpPassword If the <i>lpAccount</i> parameter specifies an account name, this parameter must point to the password to use when connecting to the domain controller. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} OUCount Receives the count of OUs returned in the list of joinable OUs.
     * @param {Pointer<PWSTR>} OUs Pointer to an array that receives the list of joinable OUs. This array is allocated by the system and must be freed using a single call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_DefaultJoinRequired</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination domain controller does not support creating computer accounts in OUs.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetjoinableous
     * @since windows5.0
     */
    static NetGetJoinableOUs(lpServer, lpDomain, lpAccount, lpPassword, OUCount, OUs) {
        result := DllCall("NETAPI32.dll\NetGetJoinableOUs", "ptr", lpServer, "ptr", lpDomain, "ptr", lpAccount, "ptr", lpPassword, "ptr", OUCount, "ptr", OUs, "uint")
        return result
    }

    /**
     * Adds an alternate name for the specified computer.
     * @remarks
     * The <b>NetAddAlternateComputerName</b> function is supported on Windows XP and later.  
     * 
     * The <b>NetAddAlternateComputerName</b> function is used to set secondary network names for computers. The primary name is the name used for authentication and maps to the machine account name.
     * 
     * The <b>NetAddAlternateComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
     * @param {Pointer<PWSTR>} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} AlternateName A pointer to a constant string that specifies the alternate name to add. This name must be in the form of a fully qualified DNS name.
     * @param {Pointer<PWSTR>} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
     *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Pointer<PWSTR>} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
     *         If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A name parameter is incorrect. This error is returned if the <i>AlternateName</i> parameter does not contain valid name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netaddalternatecomputername
     * @since windows5.1.2600
     */
    static NetAddAlternateComputerName(Server, AlternateName, DomainAccount, DomainAccountPassword, Reserved) {
        result := DllCall("NETAPI32.dll\NetAddAlternateComputerName", "ptr", Server, "ptr", AlternateName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, "uint")
        return result
    }

    /**
     * Removes an alternate name for the specified computer.
     * @remarks
     * The <b>NetRemoveAlternateComputerName</b> function is supported on Windows XP and later.  
     * 
     * The <b>NetRemoveAlternateComputerName</b> function is used to remove secondary computer names configured for the target computer.
     * 
     * The <b>NetRemoveAlternateComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
     * @param {Pointer<PWSTR>} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} AlternateName A pointer to a constant string that specifies the alternate name to remove. This name must be in the form of a fully qualified DNS name.
     * @param {Pointer<PWSTR>} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
     *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Pointer<PWSTR>} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
     *         If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A name parameter is incorrect. This error is returned if the <i>AlternateName</i> parameter does not contain valid name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netremovealternatecomputername
     * @since windows5.1.2600
     */
    static NetRemoveAlternateComputerName(Server, AlternateName, DomainAccount, DomainAccountPassword, Reserved) {
        result := DllCall("NETAPI32.dll\NetRemoveAlternateComputerName", "ptr", Server, "ptr", AlternateName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, "uint")
        return result
    }

    /**
     * Sets the primary computer name for the specified computer.
     * @remarks
     * The <b>NetSetPrimaryComputerName</b> function is supported on Windows XP and later.  
     * 
     * The <b>NetSetPrimaryComputerName</b> function is used as part of computer rename operations. The specified name will be removed from the alternate name list configured for the target computer and configured as the primary name. The computer account name will be changed to match the primary name. The previous primary computer name is moved to the alternate computer name list configured for the computer.
     * 
     * The <b>NetSetPrimaryComputerName</b> function requires that the caller is a member of the Administrators local group on the target computer.
     * @param {Pointer<PWSTR>} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} PrimaryName A pointer to a constant string that specifies the primary name to set. This name must be in the form of a fully qualified DNS name.
     * @param {Pointer<PWSTR>} DomainAccount A pointer to a constant string that specifies the domain account to use for accessing the
     *         machine account object for the computer specified in the <i>Server</i> parameter in Active Directory. If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Pointer<PWSTR>} DomainAccountPassword A pointer to a constant string that specifies the password matching the domain account passed in the <i>DomainAccount</i> parameter.
     *         If this parameter is <b>NULL</b>, then the credentials of the user executing
     *         this routine are used. 
     * 
     * This parameter is ignored if the <i>DomainAccount</i> parameter is <b>NULL</b>. This parameter is not used if the server to execute this function is not joined to a domain.
     * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A name parameter is incorrect. This error is returned if the <i>PrimaryName</i> parameter does not contain valid name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>DomainAccount</i> parameter does not contain a valid domain. This error is also returned if the <i>DomainAccount</i> parameter is not <b>NULL</b> and the <i>DomainAccountPassword</i> parameter is not <b>NULL</b> but does not contain a Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netsetprimarycomputername
     * @since windows5.1.2600
     */
    static NetSetPrimaryComputerName(Server, PrimaryName, DomainAccount, DomainAccountPassword, Reserved) {
        result := DllCall("NETAPI32.dll\NetSetPrimaryComputerName", "ptr", Server, "ptr", PrimaryName, "ptr", DomainAccount, "ptr", DomainAccountPassword, "uint", Reserved, "uint")
        return result
    }

    /**
     * Enumerates names for the specified computer.
     * @remarks
     * The <b>NetEnumerateComputerNames</b> function is supported on Windows Vista and later.  
     * 
     * The <b>NetEnumerateComputerNames</b> function is used to request the names a computer currently has configured. 
     * 
     * The <b>NetEnumerateComputerNames</b> function requires that the caller is a member of the Administrators local group on the target computer.
     * @param {Pointer<PWSTR>} Server A pointer to a constant string that specifies the name of the computer on which to execute this function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} NameType 
     * @param {Integer} Reserved Reserved for future use.   This parameter should be <b>NULL</b>.
     * @param {Pointer<UInt32>} EntryCount A pointer to a DWORD value that returns the number of names returned
     * in the buffer pointed to by the <i>ComputerNames</i> parameter if the function succeeds.
     * @param {Pointer<PWSTR>} ComputerNames A pointer to an array of pointers to names.  If the function call is successful, this parameter will return the computer names that match the computer type name specified in the <i>NameType</i> parameter. 
     * 
     * When the application no longer needs this array, this buffer should be freed by
     *         calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller was not a member of the Administrators local group on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the target computer specified in the <i>Server</i> parameter on which this function executes is running on Windows 2000 and earlier. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netenumeratecomputernames
     * @since windows5.1.2600
     */
    static NetEnumerateComputerNames(Server, NameType, Reserved, EntryCount, ComputerNames) {
        result := DllCall("NETAPI32.dll\NetEnumerateComputerNames", "ptr", Server, "int", NameType, "uint", Reserved, "ptr", EntryCount, "ptr", ComputerNames, "uint")
        return result
    }

    /**
     * Provisions a computer account for later use in an offline domain join operation.
     * @remarks
     * The <b>NetProvisionComputerAccount</b> function is supported on Windows 7 and Windows Server 2008 R2 for offline join operations.  On Windows 8 or Windows Server 2008 R2, it is recommended that the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function be used instead of the <b>NetProvisionComputerAccount</b> function.
     * 
     * The <b>NetProvisionComputerAccount</b> function is used to provision a computer account for later use in an offline domain join operation using the  <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function. The offline domain join scenario uses these functions as follows: <ul>
     * <li><b>NetProvisionComputerAccount</b>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetProvisionComputerAccount</b> is an opaque binary blob of serialized metadata used for the next step. </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a>, an image initialization function,   is then called to inject the output from the <b>NetProvisionComputerAccount</b> provisioning function into a Windows operating system image to be used during installation.  </li>
     * </ul>Changes to Windows initialization code will detect this saved state and affect the local only portion of domain join. 
     * 
     * The <b>NetProvisionComputerAccount</b> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in an opaque versioned binary blob or as text for embedding in an unattended setup answer file. The opaque binary blob can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
     * 
     * <b>Security Note:  </b>The blob returned by the <b>NetProvisionComputerAccount</b> function contains very sensitive data. It should be treated just as securely as a plaintext password. The blob contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the blob is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the blob and the unattended setup files. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the opaque blob.
     * 
     * 
     * The opaque blob returned in the  <i>pProvisionBinData</i> parameter by the <b>NetProvisionComputerAccount</b> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (joining client, provisioning machine, and domain controller). The offline join scenario currently does not limit the lifetime of the blob returned by the <b>NetProvisionComputerAccount</b> function.   
     * 
     * For offline domain joins, the access check performed depends on the configuration of the domain. Computer account creation is enabled using three methods:<ul>
     * <li>Domain administrators have rights to create computer accounts.</li>
     * <li>The SD on a container can delegate the rights to create computer accounts.</li>
     * <li>By default, authenticated users may create computer accounts by privilege. Authenticated users are limited to creating  a limited number of accounts that is specified as a quota on the domain (the default value is 10). For more information, see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-ada2/6ba13b0c-1620-478c-b2ae-eca041f2e1c4">ms-DS-MachineAccountQuota</a> attribute in the Active Directory schema.</li>
     * </ul>
     * 
     * 
     * The <b>NetProvisionComputerAccount</b> function works only with a writable domain controller and does not function against a read-only domain controller.  Once provisioning is done against a writable domain controller and the account is replicated to a read-only domain controller, then the other portions of offline domain join operation do not require access to a domain controller.
     * 
     * If the <b>NetProvisionComputerAccount</b> function is successful, the pointer in the <i>pProvisionBinData</i> or <i>pProvisionTextData</i> parameter (depending on which was parameter was not <b>NULL</b>) is returned with the serialized data for use in an offline join operation or as text in an unattended setup file.  
     * 
     * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
     * 
     * Joining (and unjoining) a computer to a domain using <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain">NetJoinDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netunjoindomain">NetUnjoinDomain</a> can be performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
     * @param {Pointer<PWSTR>} lpDomain A pointer to a <b>NULL</b>-terminated character string that specifies the name of the domain where the computer account is created.
     * @param {Pointer<PWSTR>} lpMachineName A pointer to a <b>NULL</b>-terminated character string that specifies the short name of the machine from which the computer account attribute sAMAccountName is derived by appending a '$'. This parameter must contain a valid DNS or NetBIOS machine name.
     * @param {Pointer<PWSTR>} lpMachineAccountOU An optional pointer to a <b>NULL</b>-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) where the computer account will be created. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
     * 
     * If this parameter is <b>NULL</b>, the well known computer object container will be used as published in the domain.
     * @param {Pointer<PWSTR>} lpDcName An optional pointer to a <b>NULL</b>-terminated character string that contains the name of the domain controller to target.
     * @param {Integer} dwOptions 
     * @param {Pointer<Byte>} pProvisionBinData An optional pointer that will receive the opaque binary blob of serialized metadata required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <b>NetProvisionComputerAccount</b> function completes successfully.  The data is returned as an opaque binary buffer which may be passed to <b>NetRequestOfflineDomainJoin</b> function.  
     * 
     * If this parameter is <b>NULL</b>, then <i>pProvisionTextData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  <i>pProvisionTextData</i> parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} pdwProvisionBinDataSize A pointer to a value that receives the size, in bytes, of the buffer returned in the <i>pProvisionBinData</i> parameter. 
     * 
     * This parameter must not be <b>NULL</b> if the <i>pProvisionBinData</i> parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> when the <i>pProvisionBinData</i> parameter is <b>NULL</b>.
     * @param {Pointer<PWSTR>} pProvisionTextData An optional pointer that will receive the opaque binary blob of serialized metadata required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <b>NetProvisionComputerAccount</b> function completes successfully.  The data is returned in string form for embedding in an unattended setup answer file.  
     * 
     * If this parameter is <b>NULL</b>, then the <i>pProvisionBinData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  the <i>pProvisionBinData</i> parameter must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is only allowed for the Primary Domain Controller of the domain. This error is returned if a domain controller name was specified in the <i>lpDcName</i> parameter, but the computer specified could not be validated as a domain controller for the target domain specified in the <i>lpDomain</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>lpDomain</i> or <i>lpMachineName</i> parameter is <b>NULL</b>. This error is also returned if both the <i>pProvisionBinData</i> and <i>pProvisionTextData</i> parameters are <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain did not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the <i>lpMachineAccountOU</i> parameter was specified and the domain controller is running on an earlier versions of Windows that does not support this parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>    NERR_DS8DCRequired</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain controller does not meet the version requirement for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>    NERR_LDAPCapableDCRequired</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation requires a domain controller which supports LDAP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account already exists in the domain and the NETSETUP_PROVISION_REUSE_ACCOUNT bit was not specified in the <i>dwOptions</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount
     * @since windows6.1
     */
    static NetProvisionComputerAccount(lpDomain, lpMachineName, lpMachineAccountOU, lpDcName, dwOptions, pProvisionBinData, pdwProvisionBinDataSize, pProvisionTextData) {
        result := DllCall("NETAPI32.dll\NetProvisionComputerAccount", "ptr", lpDomain, "ptr", lpMachineName, "ptr", lpMachineAccountOU, "ptr", lpDcName, "uint", dwOptions, "ptr", pProvisionBinData, "ptr", pdwProvisionBinDataSize, "ptr", pProvisionTextData, "uint")
        return result
    }

    /**
     * Executes locally on a machine to modify a Windows operating system image mounted on a volume. (NetRequestOfflineDomainJoin)
     * @remarks
     * The <b>NetRequestOfflineDomainJoin</b> function is supported on Windows 7 for offline domain join operations.  
     * 
     * The 
     * 				<b>NetRequestOfflineDomainJoin</b> function is used locally on a machine to modify a Windows operating system image mounted on a volume. The registry is loaded for the image and provisioning blob data is written where it can be retrieved during the completion phase of an offline domain join operation. The offline domain join scenario uses these functions as follows:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetProvisionComputerAccount</b> is an opaque binary blob of serialized metadata used for the next step.</li>
     * <li><b>NetRequestOfflineDomainJoin</b> , an image initialization function,   is then called to inject the output from the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> provisioning function into a Windows operating system image to be used during installation.  Changes to Windows initialization code will detect this saved state and affect the local only portion of domain join. </li>
     * </ul>
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in an opaque versioned binary blob or as text for embedding in an unattended setup answer file. The opaque binary blob can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). Note that the blob contains machine account password material essentially in the clear. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the blob and the unattended setup files. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the opaque blob .
     * 
     * 
     * The opaque blob returned in the  <i>pProvisionBinData</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (joining client, provisioning machine, and domain controller). The offline join scenario currently does not limit the lifetime of the blob returned by the <b>NetProvisionComputerAccount</b> function.   
     * 
     * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
     * @param {Pointer<Byte>} pProvisionBinData A pointer to a buffer required to initialize the registry of a Windows operating system image to process the final local state change during the completion phase of the offline domain join operation. 
     * 
     * The opaque binary blob of serialized metadata passed in the <i>pProvisionBinData</i> parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function.
     * @param {Integer} cbProvisionBinDataSize The size, in bytes, of the buffer pointed to by the <i>pProvisionBinData</i> parameter. 
     * 
     * This parameter must not be <b>NULL</b>.
     * @param {Integer} dwOptions 
     * @param {Pointer<PWSTR>} lpWindowsPath A pointer to a constant null-terminated character string that specifies the path to a Windows operating system image  under which the registry hives are located. This image must be offline and not currently booted unless the <i>dwOptions</i> parameter contains <b>NETSETUP_PROVISION_ONLINE_CALLER</b> in which case the locally running operating system directory is allowed. 
     * 
     * This path could
     *                      be a UNC path on a remote server.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ELEVATION_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation requires elevation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is returned if the <i>pProvisionBinData</i>, <i>cbProvisionBinDataSize</i>, or <i>lpWindowsPath</i> parameters are <b>NULL</b>.  This error is also returned if the buffer pointed to by the <i>pProvisionBinData</i> parameter does not contain valid data in the blob for the domain, machine account name, or machine account password. This error is also returned if the string pointed to <i>lpWindowsPath</i> parameter does not specific the path to a Windows operating system image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the specified server does not support this operation. For example, if the <i>lpWindowsPath</i> parameter references a Windows installation configured as a domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin
     * @since windows6.1
     */
    static NetRequestOfflineDomainJoin(pProvisionBinData, cbProvisionBinDataSize, dwOptions, lpWindowsPath) {
        result := DllCall("NETAPI32.dll\NetRequestOfflineDomainJoin", "ptr", pProvisionBinData, "uint", cbProvisionBinDataSize, "uint", dwOptions, "ptr", lpWindowsPath, "uint")
        return result
    }

    /**
     * Creates a provisioning package that provisions a computer account for later use in an offline domain join operation. The package may also contain information about certificates and policies to add to the machine during provisioning.
     * @remarks
     * The <b>NetCreateProvisioningPackage</b> function is supported on Windows 8 and  Windows Server 2012 for offline join operations.  For Windows 7, use the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function.
     * 
     * The <b>NetCreateProvisioningPackage</b> function is used to provision a computer account for later use in an offline domain join operation using the  <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall">NetRequestProvisioningPackageInstall</a> function.
     * 
     * The offline domain join scenario uses two functions: <ul>
     * <li><b>NetCreateProvisioningPackage</b>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetCreateProvisioningPackage</b> is a package used for the next step. </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall">NetRequestProvisioningPackageInstall</a>, an image initialization function,   is called to inject the output from the <b>NetCreateProvisioningPackage</b> provisioning function into a Windows operating system image for use during pre-installation and post-installation. </li>
     * </ul>Changes to Windows initialization code will detect this saved state and affect the local-only portion of domain join.
     * 
     * When the <i>pPackageBinData</i> and <i>pdwPackageBinDataSize</i> out pointers are used, set the <i>pPackageTextData</i> out pointer to NULL. When <i>pPackageTextData</i> is used, set the <i>pPackageBinData</i> and <i>pdwPackageBinDataSize</i> out pointers to NULL.
     * 
     * The <i>pProvisioningParams</i> parameter specifies data to include in the provisioning package. The package includes information relevant to the domain join, and it can also include information about policies and certificates to install on the machine. The provisioning package can be used in four ways:<ul>
     * <li>Domain join</li>
     * <li>Domain join and installation of certificates</li>
     * <li>Domain join and installation of policies</li>
     * <li>Domain join and installation of certificates and policies</li>
     * </ul>
     * 
     * 
     * The <b>NetCreateProvisioningPackage</b> function creates or reuses the machine account in the domain, collects all necessary metadata and returns it in a package. The package can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
     * 
     * <b>Security Note:  </b>The package returned by the <b>NetCreateProvisioningPackage</b> function contains very sensitive data. It should be treated just as securely as a plaintext password. The package contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the package is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the package. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the package.
     * 
     * 
     * The package returned in the  <i>pPackageBinData</i> parameter by the <b>NetCreateProvisioningPackage</b> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (such as joining a client, provisioning a machine, and using a domain controller). A package created on Windows 8 or Windows Server 2012 can be used Windows 7 or Windows Server 2008 R2, however only domain join information will take effect (certificates and policies are not supported). The offline join scenario currently does not limit the lifetime of the package returned by the <b>NetCreateProvisioningPackage</b> function.
     * 
     * For offline domain joins, the access check performed depends on the configuration of the domain. Computer account creation is enabled using three methods:<ul>
     * <li>Domain administrators have rights to create computer accounts.</li>
     * <li>The SD on a container can delegate the rights to create computer accounts.</li>
     * <li>By default, authenticated users may create computer accounts by privilege. Authenticated users are limited to creating  a limited number of accounts that is specified as a quota on the domain (the default value is 10). For more information, see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-ada2/6ba13b0c-1620-478c-b2ae-eca041f2e1c4">ms-DS-MachineAccountQuota</a> attribute in the Active Directory schema.</li>
     * </ul>
     * 
     * 
     * The <b>NetCreateProvisioningPackage</b> function works only with a writable domain controller and does not function against a read-only domain controller.  Once provisioning is done against a writable domain controller and the account is replicated to a read-only domain controller,  the other portions of the offline domain join operation do not require access to a domain controller.
     * 
     * If the <b>NetCreateProvisioningPackage</b> function is successful, the pointer in the <i>pPackageBinData</i> or <i>pPackageTextData</i> parameter (depending on which  parameter was not <b>NULL</b>) is returned with the serialized data for use in an offline join operation or as text in an unattended setup file.  
     * 
     * All phases of the provisioning process append to a  <i>NetSetup.log</i> file on the local computer. The provisioning process can include up to three different computers: the computer where the provisioning package is created,  the computer that requests the installation of the package,  and the computer where the  package is installed. There will be <i>NetSetup.log</i> file information stored on all three computers according to  the operation performed. Reviewing the contents of these files is the most common means of troubleshooting online and offline provisioning errors. Provisioning operations undertaken by admins are logged to the <i>NetSetup.log</i> file in the <i>%WINDIR%\Debug</i>. Provisioning operations performed by non-admins are logged to the <i>NetSetup.log</i> file  in the <i>%USERPROFILE%\Debug</i> folder.
     * 
     * For more information on offline domain join operations, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd392267(v=ws.10)">Offline Domain Join Step-by-Step Guide</a>.
     * 
     * Joining (and unjoining) a computer to a domain using <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain">NetJoinDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netunjoindomain">NetUnjoinDomain</a> is performed only by a member of the Administrators local group on the target computer. Note that the domain administrator can set additional requirements for joining the domain using delegation and assignment of privileges.
     * @param {Pointer<NETSETUP_PROVISIONING_PARAMS>} pProvisioningParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> structure that contains information about the provisioning package.
     * 
     * The following values are defined for the members of this structure:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwVersion"></a><a id="dwversion"></a><a id="DWVERSION"></a><dl>
     * <dt><b>dwVersion</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of Windows in the provisioning package. This member should use the following value defined in the <i>Lmjoin.h</i> header file:
     * 
     * NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION (0x00000001)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpDomain"></a><a id="lpdomain"></a><a id="LPDOMAIN"></a><dl>
     * <dt><b>lpDomain</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a constant null-terminated character string that specifies the name of the domain where the computer account is created. 
     * 
     * 
     *  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpMachineName"></a><a id="lpmachinename"></a><a id="LPMACHINENAME"></a><dl>
     * <dt><b>lpMachineName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a constant null-terminated character string that specifies the short name of the machine from which the computer account attribute sAMAccountName is derived by appending a '$'. This parameter must contain a valid DNS or NetBIOS machine name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpMachineAccountOU"></a><a id="lpmachineaccountou"></a><a id="LPMACHINEACCOUNTOU"></a><dl>
     * <dt><b>lpMachineAccountOU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An optional pointer to a constant null-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) where the computer account will be created. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
     * 
     * If this parameter is <b>NULL</b>, the well known computer object container will be used as published in the domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpDcName"></a><a id="lpdcname"></a><a id="LPDCNAME"></a><dl>
     * <dt><b>lpDcName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An optional pointer to a constant null-terminated character string that contains the name of the domain controller to target.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwProvisionOptions"></a><a id="dwprovisionoptions"></a><a id="DWPROVISIONOPTIONS"></a><dl>
     * <dt><b>dwProvisionOptions</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A set of bit flags that define provisioning options. This parameter can be one or more of the values specified for the <i>dwOptions</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function. 
     * 
     * These possible values are defined in the <i>Lmjoin.h</i> header file. 
     * 
     * The <b>NETSETUP_PROVISION_ROOT_CA_CERTS</b> option is only supported on Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="aCertTemplateNames"></a><a id="acerttemplatenames"></a><a id="ACERTTEMPLATENAMES"></a><dl>
     * <dt><b>aCertTemplateNames</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A optional pointer to an array of <b>NULL</b>-terminated certificate template names. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="cCertTemplateNames"></a><a id="ccerttemplatenames"></a><a id="CCERTTEMPLATENAMES"></a><dl>
     * <dt><b>cCertTemplateNames</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <b>aCertTemplateNames</b> is not NULL, this member provides an explicit count of the number of items in the array.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="aMachinePolicyNames"></a><a id="amachinepolicynames"></a><a id="AMACHINEPOLICYNAMES"></a><dl>
     * <dt><b>aMachinePolicyNames</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An optional pointer to an array of <b>NULL</b>-terminated machine policy names.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="cMachinePolicyNames"></a><a id="cmachinepolicynames"></a><a id="CMACHINEPOLICYNAMES"></a><dl>
     * <dt><b>cMachinePolicyNames</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <b>aMachinePolicyNames</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="aMachinePolicyPaths"></a><a id="amachinepolicypaths"></a><a id="AMACHINEPOLICYPATHS"></a><dl>
     * <dt><b>aMachinePolicyPaths</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An optional pointer to an array of  character strings. Each array element is a NULL-terminated character string which specifies the full or partial path to a file in the Registry Policy File format. For more information on the Registry Policy File Format , see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/registry-policy-file-format">Registry Policy File Format</a>
     * 
     * 
     * The path could
     *                      be a UNC path on a remote server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="cMachinePolicyPaths"></a><a id="cmachinepolicypaths"></a><a id="CMACHINEPOLICYPATHS"></a><dl>
     * <dt><b>cMachinePolicyPaths</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <b>aMachinePolicyPaths</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} ppPackageBinData An optional pointer that will receive the package required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function completes successfully.  The data is returned as an opaque binary buffer which may be passed to <b>NetRequestOfflineDomainJoin</b> function.  
     * 
     * If this parameter is <b>NULL</b>, then <i>pPackageTextData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  <i>pPackageTextData</i> parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} pdwPackageBinDataSize A pointer to a value that receives the size, in bytes, of the buffer returned in the <i>pProvisionBinData</i> parameter. 
     * 
     * This parameter must not be <b>NULL</b> if the <i>pPackageBinData</i> parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> when the <i>pPackageBinData</i> parameter is <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppPackageTextData An optional pointer that will receive the package required by <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestOfflineDomainJoin</a> function to complete an offline domain join, if the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetProvisionComputerAccount</a> function completes successfully.  The data is returned in string form for embedding in an unattended setup answer file.  
     * 
     * If this parameter is <b>NULL</b>, then the <i>pPackageBinData</i> parameter must not be <b>NULL</b>. If this parameter is not <b>NULL</b>, then the  the <i>pPackageBinData</i> parameter must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller does not have sufficient privileges to complete the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DOMAIN_ROLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is only allowed for the Primary Domain Controller of the domain. This error is returned if a domain controller name was specified in the <b>lpDcName </b> of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter, but the computer specified could not be validated as a domain controller for the target domain specified in the <b>lpDomain</b> of the <b>NETSETUP_PROVISIONING_PARAMS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is incorrect. This error is also returned if both the <i>pProvisioningParams</i> parameter is  <b>NULL</b>. This error is also returned if the <b>lpDomain</b> or <b>lpMachineName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter is <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain did not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if the <b>lpMachineAccountOU</b> member was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter and the domain controller is running on an earlier versions of Windows that does not support this parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>    NERR_DS8DCRequired</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified domain controller does not meet the version requirement for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>    NERR_LDAPCapableDCRequired</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation requires a domain controller which supports LDAP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_UserExists</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account already exists in the domain and the <b>NETSETUP_PROVISION_REUSE_ACCOUNT</b> bit was not specified in the <b>dwProvisionOptions</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-netsetup_provisioning_params">NETSETUP_PROVISIONING_PARAMS</a> struct pointed to by the <i>pProvisioningParams</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_WkstaNotStarted</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Workstation service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote procedure call is already in progress for this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote procedure call protocol sequence is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage
     * @since windows8.0
     */
    static NetCreateProvisioningPackage(pProvisioningParams, ppPackageBinData, pdwPackageBinDataSize, ppPackageTextData) {
        result := DllCall("NETAPI32.dll\NetCreateProvisioningPackage", "ptr", pProvisioningParams, "ptr", ppPackageBinData, "ptr", pdwPackageBinDataSize, "ptr", ppPackageTextData, "uint")
        return result
    }

    /**
     * Executes locally on a machine to modify a Windows operating system image mounted on a volume. (NetRequestProvisioningPackageInstall)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netrequestofflinedomainjoin">NetRequestProvisioningPackageInstall</a> function is supported on Windows 8 for offline domain join operations.  For  Windows 7, use <b>NetRequestOfflineDomainJoin</b>.
     * 
     * The offline domain join scenario uses two functions: <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a>  is a provisioning function that is first called to perform the network operations necessary to create and configure the computer object in Active Directory. The output from the <b>NetCreateProvisioningPackage</b> is a package used for the next step. </li>
     * <li><b>NetRequestProvisioningPackageInstall</b>, an image initialization function,   is called to inject the output from the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> provisioning function into a Windows operating system image for use during installation. </li>
     * </ul>Changes to Windows initialization code will detect this saved state and affect the local-only portion of domain join and install any certificate and  policy information that may have been present in the package.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function will create or reuse the machine account in the domain, collect all necessary metadata and return it in a package. The package can be consumed by the offline domain join request operation supplying all the necessary input to complete the domain join during first boot without any network operations (local state updates only). 
     * 
     * <b>Security Note:  </b>The package created by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function contains very sensitive data. It should be treated just as securely as a plaintext password. The package contains the machine account password and other information about the domain, including the domain name, the name of a domain controller, and the security ID (SID) of the domain. If the package is being transported physically or over the network, care must be taken to transport it securely. The design makes no provisions for securing this data.  This problem exists today with unattended setup answer files which can carry a number of secrets including domain user passwords. The caller must secure the package. Solutions to this problem are varied. As an example, a pre-exchanged key could be used to encrypt a session between the consumer and provisioning entity enabling a secure transfer of the package.
     * 
     * 
     * The package returned in the  <i>pPackageBinData</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function is versioned to allow interoperability and serviceability scenarios between different versions of Windows (such as joining a client, provisioning a machine, and using a domain controller). The offline join scenario currently does not limit the lifetime of the package returned by the <b>NetCreateProvisioningPackage</b> function.
     * 
     * All phases of the provisioning process append to a  <i>NetSetup.log</i> file on the local computer. The provisioning process can include up to three different computers: the computer where the provisioning package is created,  the computer that requests the installation of the package,  and the computer where the  package is installed. There will be <i>NetSetup.log</i> file information stored on all three computers according to  the operation performed. Reviewing the contents of these files is the most common means of troubleshooting online and offline provisioning errors. Provisioning operations undertaken by admins are logged to the <i>NetSetup.log</i> file in the <i>%WINDIR%\Debug</i>. Provisioning operations performed by non-admins are logged to the <i>NetSetup.log</i> file  in the <i>%USERPROFILE%\Debug</i> folder.
     * @param {Pointer<Byte>} pPackageBinData A pointer to a buffer required to initialize the registry of a Windows operating system image to process the final local state change during the completion phase of the offline domain join operation. 
     * 
     * The opaque binary blob of serialized metadata passed in the <i>pPackageBinData</i> parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netprovisioncomputeraccount">NetCreateProvisioningPackage</a> function.
     * @param {Integer} dwPackageBinDataSize The size, in bytes, of the buffer pointed to by the <i>pPackageBinData</i> parameter. 
     * 
     * This parameter must not be <b>NULL</b>.
     * @param {Integer} dwProvisionOptions 
     * @param {Pointer<PWSTR>} lpWindowsPath A pointer to a <b>NULL</b>-terminated character string that specifies the path to a Windows operating system image  under which the registry hives are located. This image must be offline and not currently booted unless the <i>dwProvisionOptions</i> parameter contains <b>NETSETUP_PROVISION_ONLINE_CALLER</b>, in which case, the locally running operating system directory is allowed. 
     * 
     * This path could
     *                      be a UNC path on a remote server.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be one of the following <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-error-codes">Network Management error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NoOfflineJoinInfo </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline join completion information was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BadOfflineJoinInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline join completion information was bad.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_CantCreateJoinInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to create offline join information. Please ensure you have access to the specified path location and permissions to modify its contents. Running as an elevated administrator may be required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_BadDomainJoinInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain join info being saved was incomplete or bad.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_JoinPerformedMustRestart</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offline join operation successfully completed but a restart is needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_NoJoinPending</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no offline join operation pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ValuesNotSet</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set one or more requested machine or domain name values on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_CantVerifyHostname</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not verify the current machine's hostname against the saved value in the join completion information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_CantLoadOfflineHive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the specified offline registry hive. Please ensure you have access to the specified path location and permissions to modify its contents. Running as an elevated administrator may be required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ConnectionInsecure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minimum session security requirements for this operation were not met.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_ProvisioningBlobUnsupported</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Computer account provisioning blob version is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netrequestprovisioningpackageinstall
     * @since windows8.0
     */
    static NetRequestProvisioningPackageInstall(pPackageBinData, dwPackageBinDataSize, dwProvisionOptions, lpWindowsPath) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("NETAPI32.dll\NetRequestProvisioningPackageInstall", "ptr", pPackageBinData, "uint", dwPackageBinDataSize, "uint", dwProvisionOptions, "ptr", lpWindowsPath, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Retrieves the join information for the specified tenant. This function examines the join information for Microsoft Azure Active Directory and the work account that the current user added.
     * @param {Pointer<PWSTR>} pcszTenantId The tenant identifier for the joined account. If the device
     *                        is not joined to Azure Active Directory (Azure AD), and the user currently logged into Windows added no Azure AD work accounts  for the specified tenant,
     *                        the buffer that the <i>ppJoinInfo</i> parameter points to  is set to NULL.
     * 
     * If the specified
     *                        tenant ID is NULL or empty, <i>ppJoinInfo</i> is set to the default
     *                        join account information, or NULL if the device is not joined to Azure AD and the current user added  no Azure AD work accounts.
     *                        
     * The default join account is one of the following:
     * 
     * <ul>
     * <li>The Azure AD account, if the device is joined to Azure AD.</li>
     * <li>The Azure AD work account that the current user added, if the device is not joined to Azure AD,
     *                        but the current user added a single Azure AD work account.</li>
     * <li>Any of the Azure AD work accounts that the current user added,  if the device is not joined to Azure AD, but the current user added multiple
     *                        Azure AD work accounts. The algorithm for selecting one of the work
     *                        accounts is not specified.</li>
     * </ul>
     * @param {Pointer<DSREG_JOIN_INFO>} ppJoinInfo The join information for the tenant that the <i>pcszTenantId</i> parameter specifies. If this parameter is NULL,  the device is not joined to Azure AD and the current user added no Azure AD work accounts. You must call
     *                      the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netfreeaadjoininformation">NetFreeAadJoinInformation</a> function to free the memory allocated for
     *                      this structure.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetaadjoininformation
     * @since windows10.0.10240
     */
    static NetGetAadJoinInformation(pcszTenantId, ppJoinInfo) {
        result := DllCall("NETAPI32.dll\NetGetAadJoinInformation", "ptr", pcszTenantId, "ptr", ppJoinInfo, "int")
        return result
    }

    /**
     * Frees the memory allocated for the specified DSREG_JOIN_INFO structure, which contains join information for a tenant and which you retrieved by calling the NetGetAadJoinInformation function.
     * @param {Pointer<DSREG_JOIN_INFO>} pJoinInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/ns-lmjoin-dsreg_join_info">DSREG_JOIN_INFO</a> structure for which you want to free the memory.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netfreeaadjoininformation
     * @since windows10.0.10240
     */
    static NetFreeAadJoinInformation(pJoinInfo) {
        DllCall("NETAPI32.dll\NetFreeAadJoinInformation", "ptr", pJoinInfo)
    }

    /**
     * The NetGetJoinInformation function retrieves join status information for the specified computer.
     * @remarks
     * No special group membership is required to successfully execute the 
     * <b>NetGetJoinInformation</b> function.
     * @param {Pointer<PWSTR>} lpServer Pointer to a constant string that specifies the DNS or NetBIOS name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpNameBuffer Pointer to the buffer that receives the NetBIOS name of the domain or workgroup to which the computer is joined. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<Int32>} BufferType 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value can be the following error code or one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to process this command.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetjoininformation
     * @since windows5.0
     */
    static NetGetJoinInformation(lpServer, lpNameBuffer, BufferType) {
        result := DllCall("NETAPI32.dll\NetGetJoinInformation", "ptr", lpServer, "ptr", lpNameBuffer, "ptr", BufferType, "uint")
        return result
    }

    /**
     * The GetNetScheduleAccountInformation function retrieves the AT Service account name.
     * @remarks
     * To successfully call the <b>GetNetScheduleAccountInformation</b> function,  the caller should have read access to the task folder  which is usually %windir%\tasks or as defined in the following registry setting:
     * 
     * <b>HKLM\SOFTWARE\Microsoft\SchedulingAgent\TasksFolder\
     * </b>
     * @param {Pointer<PWSTR>} pwszServerName A NULL-terminated wide character string for the name of the computer whose account information is being retrieved.
     * @param {Integer} ccAccount The number of characters, including the NULL terminator, allocated for <i>wszAccount</i>. The maximum allowed length for this value is the maximum domain name length plus the maximum user name length plus 2, expressed as DNLEN + UNLEN + 2. (The last two characters are the "\" character and the NULL terminator.)
     * @param {Pointer<PWSTR>} wszAccount An array of wide characters, including the NULL terminator, that receives the account information.
     * @returns {Integer} The return value is an HRESULT. A value of S_OK indicates the function succeeded, and the account information is  returned in <i>wszAccount</i>. A value of S_FALSE  indicates the function succeeded, and the account is the Local System account (no information will be returned in <i>wszAccount</i>). Any other return values indicate an error condition.
     * @see https://learn.microsoft.com/windows/win32/api/atacct/nf-atacct-getnetscheduleaccountinformation
     * @since windows6.0.6000
     */
    static GetNetScheduleAccountInformation(pwszServerName, ccAccount, wszAccount) {
        result := DllCall("mstask.dll\GetNetScheduleAccountInformation", "ptr", pwszServerName, "uint", ccAccount, "ptr", wszAccount, "int")
        return result
    }

    /**
     * The SetNetScheduleAccountInformation function sets the AT Service account name and password. The AT Service account name and password are used as the credentials for scheduled jobs created with NetScheduleJobAdd.
     * @remarks
     * The <b>SetNetScheduleAccountInformation</b> impersonates the caller. Only members of the local Administrators group on the computer where the schedule account information is being set can successfully execute this function. Note that <b>NULL</b> passwords are not allowed.
     * @param {Pointer<PWSTR>} pwszServerName A NULL-terminated wide character string for the name of the computer whose account information is being set.
     * @param {Pointer<PWSTR>} pwszAccount A pointer to a NULL-terminated wide character string for the account. To specify the local system account, set this parameter to <b>NULL</b>.
     * @param {Pointer<PWSTR>} pwszPassword A pointer to a NULL-terminated wide character string for the password. For information about securing password information, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @returns {Integer} The return value is an HRESULT. A value of S_OK indicates the account name and password were successfully set. Any other value indicates an error condition.
     * 
     * If the function fails, some of the possible return values are listed below. 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x080070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied. This error is returned if the caller was not a member of the Administrators group. This error is also returned if the <i>pwszAccount</i> parameter  was  not <b>NULL</b> indicating a named account not the local system account and the <i>pwszPassword</i> parameter was incorrect for the account specified in the <i>pwszAccount</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * <dt>0x08007000d</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is invalid. This error is returned if the <i>pwszPassword</i> parameter was <b>NULL</b> or the length of  <i>pwszPassword</i> parameter string was too long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_ACCOUNT_NAME_NOT_FOUND</b></dt>
     * <dt>0x80041310</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to establish existence of the account specified. This error is returned if the <i>pwszAccount</i> parameter  was  not <b>NULL</b> indicating a named account not the local system account and  the <i>pwszAccount</i> parameter could not be found. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/atacct/nf-atacct-setnetscheduleaccountinformation
     * @since windows6.0.6000
     */
    static SetNetScheduleAccountInformation(pwszServerName, pwszAccount, pwszPassword) {
        result := DllCall("mstask.dll\SetNetScheduleAccountInformation", "ptr", pwszServerName, "ptr", pwszAccount, "ptr", pwszPassword, "int")
        return result
    }

    /**
     * The NetScheduleJobAdd function submits a job to run at a specified future time and date. This function requires that the schedule service be started on the computer to which the job is submitted.
     * @remarks
     * Normally only members of the local Administrators group on the computer where the schedule job is being added can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  remote server can successfully execute this function. 
     * 
     * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
     * 
     * 
     * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
     * 
     * The following are examples of how to schedule jobs using different properties supported by the 
     * <b>NetScheduleJobAdd</b> function.
     * 
     * To schedule a job that executes once:
     * 
     * <ul>
     * <li>Set the <b>DaysOfMonth</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to zero.</li>
     * <li>Set the <b>DaysOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to zero.</li>
     * <li>Set the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
     * </ul>
     * The job executes at the time specified by the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter. After the job executes, it is deleted.
     * 
     * To schedule and delete a job that executes multiple times:
     * 
     * <ul>
     * <li>Set the appropriate bits in the  <b>DaysOfMonth</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure or </li>
     * <li>Set the appropriate bits in the  <b>DaysOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. </li>
     * <li>Set the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  You do not need to set both the  <b>DaysOfMonth</b> and the  <b>DaysOfWeek</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</div>
     * <div> </div>
     * The job executes at the time specified by the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter, once for each day set in the  <b>DaysOfMonth</b> or <b>DaysOfWeek</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. After each job executes, the corresponding bit is cleared. When the last bit is cleared, the job is deleted.
     * 
     * To schedule a job that executes periodically:
     * 
     * <ul>
     * <li>Set the appropriate bits in the <b>DaysOfMonth</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure or</li>
     * <li>Set the appropriate bits in the <b>DaysOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. </li>
     * <li>Set the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure to the time the job should execute.</li>
     * <li>Set the job submission flag JOB_RUN_PERIODICALLY in the <b>Flags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  You do not need to set both the  <b>DaysOfMonth</b> and the  <b>DaysOfWeek</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure.</div>
     * <div> </div>
     * The job will execute periodically, at the time specified by the <b>JobTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure pointed to by the <i>Buffer</i> parameter, on each day set in the <b>DaysOfMonth</b> or <b>DaysOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure. The job will not be deleted as a result of the repeated executions. The only way to delete the job is by an explicit call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobdel">NetScheduleJobDel</a> function.
     * 
     * See 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure for a description of the <b>DaysOfWeek</b>, <b>DaysOfMonth</b>, and  job property bitmasks.
     * 
     * On Windows 2000, the earlier AT service and the Task Scheduler were combined. The Task Scheduler service was only accurate to the minute.  Therefore, the <b>NetScheduleJobAdd</b> function only uses hours and minutes specified in the <b>JobTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure when a job is scheduled to run. 
     * 
     * Starting with   Windows Vista, the precision for the Task Scheduler was increased to the second. Therefore, the <b>NetScheduleJobAdd</b> function uses only the hours, minutes, and seconds specified in the <b>JobTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure when a job is scheduled to run.
     * @param {Pointer<PWSTR>} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<Byte>} Buffer A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure describing the job to submit. For more information about scheduling jobs using different job properties, see the following Remarks section and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @param {Pointer<UInt32>} JobId A pointer that receives a job identifier for the newly submitted job. This entry is valid only if the function returns successfully.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobadd
     * @since windows5.0
     */
    static NetScheduleJobAdd(Servername, Buffer, JobId) {
        result := DllCall("NETAPI32.dll\NetScheduleJobAdd", "ptr", Servername, "ptr", Buffer, "ptr", JobId, "uint")
        return result
    }

    /**
     * The NetScheduleJobDel function deletes a range of jobs queued to run at a computer. This function requires that the schedule service be started at the computer to which the job deletion request is being sent.
     * @remarks
     * Normally only members of the local Administrators group on the computer where the schedule job is being deleted can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
     * 
     * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
     * 
     * 
     * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobenum">NetScheduleJobEnum</a> function to retrieve the job identifier for one or more scheduled jobs.
     * 
     * The 
     * <b>NetScheduleJobDel</b> function deletes all jobs whose job identifiers are in the range <i>MinJobId</i> through <i>MaxJobId</i>.
     * 
     * To delete all scheduled jobs at the server, you can call 
     * <b>NetScheduleJobDel</b> specifying <i>MinJobId</i> equal to 0 and <i>MaxJobId</i> equal to – 1. To delete one job, specify the job's identifier for both the <i>MinJobId</i> parameter and the <i>MaxJobId</i> parameter.
     * @param {Pointer<PWSTR>} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} MinJobId The minimum job identifier. Jobs with a job identifier smaller than <i>MinJobId</i> will not be deleted.
     * @param {Integer} MaxJobId The  maximum job identifier. Jobs with a job identifier larger than <i>MaxJobId</i> will not be deleted.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobdel
     * @since windows5.0
     */
    static NetScheduleJobDel(Servername, MinJobId, MaxJobId) {
        result := DllCall("NETAPI32.dll\NetScheduleJobDel", "ptr", Servername, "uint", MinJobId, "uint", MaxJobId, "uint")
        return result
    }

    /**
     * The NetScheduleJobEnum function lists the jobs queued on a specified computer. This function requires that the schedule service be started.
     * @remarks
     * Normally only members of the local Administrators group on the computer where the schedule job is being enumerated can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
     * 
     * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
     * 
     * 
     * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
     * 
     * Each entry returned contains an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_enum">AT_ENUM</a> structure. The value of the <b>JobId</b> member can be used when calling functions that require a job identifier parameter, such as the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobdel">NetScheduleJobDel</a> function.
     * @param {Pointer<PWSTR>} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<Byte>} PointerToBuffer A pointer to the buffer that receives the data. The return information is an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_enum">AT_ENUM</a> structures. The buffer is allocated by the system and must be freed using a single call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
     * @param {Integer} PrefferedMaximumLength A value that indicates the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @param {Pointer<UInt32>} EntriesRead A pointer to a value that receives the count of elements actually enumerated.
     * @param {Pointer<UInt32>} TotalEntries A pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
     * @param {Pointer<UInt32>} ResumeHandle A pointer to a value that contains a resume handle which is used to continue a job enumeration. The handle should be zero on the first call and left unchanged for subsequent calls. If this parameter is <b>NULL</b>, then no resume handle is stored.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobenum
     * @since windows5.0
     */
    static NetScheduleJobEnum(Servername, PointerToBuffer, PrefferedMaximumLength, EntriesRead, TotalEntries, ResumeHandle) {
        result := DllCall("NETAPI32.dll\NetScheduleJobEnum", "ptr", Servername, "ptr", PointerToBuffer, "uint", PrefferedMaximumLength, "ptr", EntriesRead, "ptr", TotalEntries, "ptr", ResumeHandle, "uint")
        return result
    }

    /**
     * The NetScheduleJobGetInfo function retrieves information about a particular job queued on a specified computer. This function requires that the schedule service be started.
     * @remarks
     * Normally only members of the local Administrators group on the computer where the schedule job is being enumerated can successfully execute this function. If the server name passed in the string pointed to by the <i>Servername</i> parameter is a remote server, then only members of the local Administrators group on the  server can successfully execute this function. 
     * 
     * If the following registry value has the least significant bit set (for example, 0x00000001), then users belonging to the Server Operators group can also successfully execute this function.
     * 
     * 
     * <b>HKLM\System\CurrentControlSet\Control\Lsa\SubmitControl</b>
     * @param {Pointer<PWSTR>} Servername A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} JobId A value that indicates the identifier of the job for which to retrieve information.
     * @param {Pointer<Byte>} PointerToBuffer A pointer to the buffer that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/ns-lmat-at_info">AT_INFO</a> structure describing the specified job. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmat/nf-lmat-netschedulejobgetinfo
     * @since windows5.0
     */
    static NetScheduleJobGetInfo(Servername, JobId, PointerToBuffer) {
        result := DllCall("NETAPI32.dll\NetScheduleJobGetInfo", "ptr", Servername, "uint", JobId, "ptr", PointerToBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpszCallerName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static TraceRegisterExA(lpszCallerName, dwFlags) {
        result := DllCall("rtutils.dll\TraceRegisterExA", "ptr", lpszCallerName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @returns {Integer} 
     */
    static TraceDeregisterA(dwTraceID) {
        result := DllCall("rtutils.dll\TraceDeregisterA", "uint", dwTraceID, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static TraceDeregisterExA(dwTraceID, dwFlags) {
        result := DllCall("rtutils.dll\TraceDeregisterExA", "uint", dwTraceID, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Pointer<HANDLE>} lphConsole 
     * @returns {Integer} 
     */
    static TraceGetConsoleA(dwTraceID, lphConsole) {
        result := DllCall("rtutils.dll\TraceGetConsoleA", "uint", dwTraceID, "ptr", lphConsole, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Pointer<PSTR>} lpszFormat 
     * @returns {Integer} 
     */
    static TracePrintfA(dwTraceID, lpszFormat) {
        result := DllCall("rtutils.dll\TracePrintfA", "uint", dwTraceID, "ptr", lpszFormat, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PSTR>} lpszFormat 
     * @returns {Integer} 
     */
    static TracePrintfExA(dwTraceID, dwFlags, lpszFormat) {
        result := DllCall("rtutils.dll\TracePrintfExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PSTR>} lpszFormat 
     * @param {Pointer<SByte>} arglist 
     * @returns {Integer} 
     */
    static TraceVprintfExA(dwTraceID, dwFlags, lpszFormat, arglist) {
        result := DllCall("rtutils.dll\TraceVprintfExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, "ptr", arglist, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PSTR>} lpszString 
     * @returns {Integer} 
     */
    static TracePutsExA(dwTraceID, dwFlags, lpszString) {
        result := DllCall("rtutils.dll\TracePutsExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszString, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} lpbBytes 
     * @param {Integer} dwByteCount 
     * @param {Integer} dwGroupSize 
     * @param {Integer} bAddressPrefix 
     * @param {Pointer<PSTR>} lpszPrefix 
     * @returns {Integer} 
     */
    static TraceDumpExA(dwTraceID, dwFlags, lpbBytes, dwByteCount, dwGroupSize, bAddressPrefix, lpszPrefix) {
        result := DllCall("rtutils.dll\TraceDumpExA", "uint", dwTraceID, "uint", dwFlags, "ptr", lpbBytes, "uint", dwByteCount, "uint", dwGroupSize, "int", bAddressPrefix, "ptr", lpszPrefix, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszCallerName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static TraceRegisterExW(lpszCallerName, dwFlags) {
        result := DllCall("rtutils.dll\TraceRegisterExW", "ptr", lpszCallerName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @returns {Integer} 
     */
    static TraceDeregisterW(dwTraceID) {
        result := DllCall("rtutils.dll\TraceDeregisterW", "uint", dwTraceID, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static TraceDeregisterExW(dwTraceID, dwFlags) {
        result := DllCall("rtutils.dll\TraceDeregisterExW", "uint", dwTraceID, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Pointer<HANDLE>} lphConsole 
     * @returns {Integer} 
     */
    static TraceGetConsoleW(dwTraceID, lphConsole) {
        result := DllCall("rtutils.dll\TraceGetConsoleW", "uint", dwTraceID, "ptr", lphConsole, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Pointer<PWSTR>} lpszFormat 
     * @returns {Integer} 
     */
    static TracePrintfW(dwTraceID, lpszFormat) {
        result := DllCall("rtutils.dll\TracePrintfW", "uint", dwTraceID, "ptr", lpszFormat, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} lpszFormat 
     * @returns {Integer} 
     */
    static TracePrintfExW(dwTraceID, dwFlags, lpszFormat) {
        result := DllCall("rtutils.dll\TracePrintfExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} lpszFormat 
     * @param {Pointer<SByte>} arglist 
     * @returns {Integer} 
     */
    static TraceVprintfExW(dwTraceID, dwFlags, lpszFormat, arglist) {
        result := DllCall("rtutils.dll\TraceVprintfExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszFormat, "ptr", arglist, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} lpszString 
     * @returns {Integer} 
     */
    static TracePutsExW(dwTraceID, dwFlags, lpszString) {
        result := DllCall("rtutils.dll\TracePutsExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpszString, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwTraceID 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} lpbBytes 
     * @param {Integer} dwByteCount 
     * @param {Integer} dwGroupSize 
     * @param {Integer} bAddressPrefix 
     * @param {Pointer<PWSTR>} lpszPrefix 
     * @returns {Integer} 
     */
    static TraceDumpExW(dwTraceID, dwFlags, lpbBytes, dwByteCount, dwGroupSize, bAddressPrefix, lpszPrefix) {
        result := DllCall("rtutils.dll\TraceDumpExW", "uint", dwTraceID, "uint", dwFlags, "ptr", lpbBytes, "uint", dwByteCount, "uint", dwGroupSize, "int", bAddressPrefix, "ptr", lpszPrefix, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwMessageId 
     * @param {Integer} cNumberOfSubStrings 
     * @param {Pointer<PSTR>} plpwsSubStrings 
     * @param {Integer} dwErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static LogErrorA(dwMessageId, cNumberOfSubStrings, plpwsSubStrings, dwErrorCode) {
        DllCall("rtutils.dll\LogErrorA", "uint", dwMessageId, "uint", cNumberOfSubStrings, "ptr", plpwsSubStrings, "uint", dwErrorCode)
    }

    /**
     * 
     * @param {Integer} wEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} cNumberOfSubStrings 
     * @param {Pointer<PSTR>} plpwsSubStrings 
     * @returns {String} Nothing - always returns an empty string
     */
    static LogEventA(wEventType, dwMessageId, cNumberOfSubStrings, plpwsSubStrings) {
        DllCall("rtutils.dll\LogEventA", "uint", wEventType, "uint", dwMessageId, "uint", cNumberOfSubStrings, "ptr", plpwsSubStrings)
    }

    /**
     * 
     * @param {Integer} dwMessageId 
     * @param {Integer} cNumberOfSubStrings 
     * @param {Pointer<PWSTR>} plpwsSubStrings 
     * @param {Integer} dwErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static LogErrorW(dwMessageId, cNumberOfSubStrings, plpwsSubStrings, dwErrorCode) {
        DllCall("rtutils.dll\LogErrorW", "uint", dwMessageId, "uint", cNumberOfSubStrings, "ptr", plpwsSubStrings, "uint", dwErrorCode)
    }

    /**
     * 
     * @param {Integer} wEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} cNumberOfSubStrings 
     * @param {Pointer<PWSTR>} plpwsSubStrings 
     * @returns {String} Nothing - always returns an empty string
     */
    static LogEventW(wEventType, dwMessageId, cNumberOfSubStrings, plpwsSubStrings) {
        DllCall("rtutils.dll\LogEventW", "uint", wEventType, "uint", dwMessageId, "uint", cNumberOfSubStrings, "ptr", plpwsSubStrings)
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpszSource 
     * @returns {Pointer<HANDLE>} 
     */
    static RouterLogRegisterA(lpszSource) {
        result := DllCall("rtutils.dll\RouterLogRegisterA", "ptr", lpszSource, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogDeregisterA(hLogHandle) {
        DllCall("rtutils.dll\RouterLogDeregisterA", "ptr", hLogHandle)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PSTR>} plpszSubStringArray 
     * @param {Integer} dwErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode) {
        DllCall("rtutils.dll\RouterLogEventA", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwErrorCode)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PSTR>} plpszSubStringArray 
     * @param {Integer} dwDataBytes 
     * @param {Pointer<Byte>} lpDataBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventDataA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwDataBytes, lpDataBytes) {
        DllCall("rtutils.dll\RouterLogEventDataA", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwDataBytes, "ptr", lpDataBytes)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PSTR>} plpszSubStringArray 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwErrorIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventStringA(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode, dwErrorIndex) {
        DllCall("rtutils.dll\RouterLogEventStringA", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwErrorCode, "uint", dwErrorIndex)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwMessageId 
     * @param {Pointer<PSTR>} ptszFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventExA(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat) {
        DllCall("rtutils.dll\RouterLogEventExA", "ptr", hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, "CDecl ")
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwMessageId 
     * @param {Pointer<PSTR>} ptszFormat 
     * @param {Pointer<SByte>} arglist 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventValistExA(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, arglist) {
        DllCall("rtutils.dll\RouterLogEventValistExA", "ptr", hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, "ptr", arglist)
    }

    /**
     * 
     * @param {Integer} dwErrorCode 
     * @param {Pointer<PSTR>} lplpszErrorString 
     * @returns {Integer} 
     */
    static RouterGetErrorStringA(dwErrorCode, lplpszErrorString) {
        result := DllCall("rtutils.dll\RouterGetErrorStringA", "uint", dwErrorCode, "ptr", lplpszErrorString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszSource 
     * @returns {Pointer<HANDLE>} 
     */
    static RouterLogRegisterW(lpszSource) {
        result := DllCall("rtutils.dll\RouterLogRegisterW", "ptr", lpszSource, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogDeregisterW(hLogHandle) {
        DllCall("rtutils.dll\RouterLogDeregisterW", "ptr", hLogHandle)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PWSTR>} plpszSubStringArray 
     * @param {Integer} dwErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode) {
        DllCall("rtutils.dll\RouterLogEventW", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwErrorCode)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PWSTR>} plpszSubStringArray 
     * @param {Integer} dwDataBytes 
     * @param {Pointer<Byte>} lpDataBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventDataW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwDataBytes, lpDataBytes) {
        DllCall("rtutils.dll\RouterLogEventDataW", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwDataBytes, "ptr", lpDataBytes)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwMessageId 
     * @param {Integer} dwSubStringCount 
     * @param {Pointer<PWSTR>} plpszSubStringArray 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwErrorIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventStringW(hLogHandle, dwEventType, dwMessageId, dwSubStringCount, plpszSubStringArray, dwErrorCode, dwErrorIndex) {
        DllCall("rtutils.dll\RouterLogEventStringW", "ptr", hLogHandle, "uint", dwEventType, "uint", dwMessageId, "uint", dwSubStringCount, "ptr", plpszSubStringArray, "uint", dwErrorCode, "uint", dwErrorIndex)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwMessageId 
     * @param {Pointer<PWSTR>} ptszFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventExW(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat) {
        DllCall("rtutils.dll\RouterLogEventExW", "ptr", hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, "CDecl ")
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hLogHandle 
     * @param {Integer} dwEventType 
     * @param {Integer} dwErrorCode 
     * @param {Integer} dwMessageId 
     * @param {Pointer<PWSTR>} ptszFormat 
     * @param {Pointer<SByte>} arglist 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterLogEventValistExW(hLogHandle, dwEventType, dwErrorCode, dwMessageId, ptszFormat, arglist) {
        DllCall("rtutils.dll\RouterLogEventValistExW", "ptr", hLogHandle, "uint", dwEventType, "uint", dwErrorCode, "uint", dwMessageId, "ptr", ptszFormat, "ptr", arglist)
    }

    /**
     * 
     * @param {Integer} dwErrorCode 
     * @param {Pointer<PWSTR>} lplpwszErrorString 
     * @returns {Integer} 
     */
    static RouterGetErrorStringW(dwErrorCode, lplpwszErrorString) {
        result := DllCall("rtutils.dll\RouterGetErrorStringW", "uint", dwErrorCode, "ptr", lplpwszErrorString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszFailedAssertion 
     * @param {Pointer<PSTR>} pszFileName 
     * @param {Integer} dwLineNumber 
     * @param {Pointer<PSTR>} pszMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterAssert(pszFailedAssertion, pszFileName, dwLineNumber, pszMessage) {
        DllCall("rtutils.dll\RouterAssert", "ptr", pszFailedAssertion, "ptr", pszFileName, "uint", dwLineNumber, "ptr", pszMessage)
    }

    /**
     * 
     * @param {Integer} dwTransportId 
     * @param {Pointer<Byte>} lplpBuffer 
     * @param {Pointer<UInt32>} lpdwEntriesRead 
     * @returns {Integer} 
     */
    static MprSetupProtocolEnum(dwTransportId, lplpBuffer, lpdwEntriesRead) {
        result := DllCall("rtutils.dll\MprSetupProtocolEnum", "uint", dwTransportId, "ptr", lplpBuffer, "ptr", lpdwEntriesRead, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @returns {Integer} 
     */
    static MprSetupProtocolFree(lpBuffer) {
        result := DllCall("rtutils.dll\MprSetupProtocolFree", "ptr", lpBuffer, "uint")
        return result
    }

;@endregion Methods
}
